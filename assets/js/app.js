var team_select;
Ext.application({
    name : 'My App',
    launch : function() {

        
        Ext.onReady(function(){
            Ext.create('Ext.panel.Panel', {
                renderTo: Ext.getBody(),
                width: 900,
                height: 600,
                padding:10,
                title: 'База данных игроков НБА',
                layout: {
                    type: 'hbox',
                    align: 'stretch'
                },
                items: [
                        {
                        xtype: 'panel',
                        width: 200,
                        items: [treeMenu]
                    },{
                        xtype: 'panel',
                        width: 700,
                        items: [gridClients, gridInfo, {
                            xtype: 'panel',
                            title: 'Дополнительная информация',
                            html: '<div id="selTree"></div> <div id="selClient"></div> <div id="countData"></div> ',
                            width: 700,
                            height: 150
                        }]
                    },
                ]
            });
        });

        treeMenu = Ext.create('Ext.tree.Panel', {
            title: 'Дерево элементов',
            rootVisible: true,
            split: true,
            region: 'west',
            collapsible: true,
            floatable: false,
            width: 200,
            height: 600,
            useArrows: true,
            renderTo: document.body,
            root: {
                text: 'Команды нба',
                expanded: true,
                children: [
                    {
                        text: 'Восток',
                        expanded: true,
                        children: [
                            {
                                id: '1',
                                text: 'Майами',
                                leaf: true
                            },
                            {
                                id: '2',
                                text: 'Кливленд',
                                leaf: true
                            }
                        ]
                    },
                    {
                        text: 'Запад',
                        expanded: true,
                        children: [
                            {
                                id: '3',
                                text: 'Лейкерс',
                                leaf: true
                            },
                            {
                                id: '4',
                                text: 'Клиперс',
                                leaf: true
                            },
                            {
                                id: '5',
                                text: 'Сакроменто',
                                leaf: true
                            }
                        ]
                    }
                ]
            },
            listeners: {
                itemclick: {
                    fn: function(view, record, item, index, event) {
                        storeList.load({
                            url: '/api/users?team=' + record.data.id
                        });
                        team_select = record.data.id;
                        console.log(record.data.id);
                        console.log(record.data);
                        document.getElementById('selTree').innerHTML = 'Выбрана команда ' + record.data.text;

                        document.getElementById('countData').innerHTML = '';
                        document.getElementById('selClient').innerHTML = '';
    
                    }
                }
            }
        });

        Ext.define('clientsList', {
           extend: 'Ext.data.Model',
           fields: ['player_id', 'player_name', 'player_sname', 'player_position', 'player_level']
        });
        
        Ext.define('clientInfo', {
           extend: 'Ext.data.Model',
           fields: ['c_team', 'c_year']
        });
    
        storeList = Ext.create('Ext.data.Store', {
            model: 'clientsList',
            proxy: {
                type: 'ajax',
                reader: {
                    type: 'json',
                }
            }
        });

        storeInfo = Ext.create('Ext.data.Store', {
            model: 'clientInfo',
            proxy: {
                type: 'ajax',
                reader: {
                    type: 'json',
                }
            }
        });
    
        gridClients = Ext.create('Ext.grid.Panel', {
            title: 'Список игроков',
            store: storeList,
            height: 200,
            renderTo: document.body,
            columns: [
                { header: '№ Игрока', width: 100, dataIndex: 'player_id' },
                { header: 'First_name', width: 100, dataIndex: 'player_name' },
                { header: 'Second_name', width: 100, dataIndex: 'player_sname' },
                { header: 'Позиция', width: 100, dataIndex: 'player_position' },
                { header: 'Почта', width: 120, dataIndex: 'player_level' },
            ],
            viewConfig: {
                stripeRows: true
            },
            listeners: {
                itemclick: {
                    fn: function(view, record, item, index, event) {
                        storeInfo.load({
                            url: '/api/user_info?team=' + team_select + '&player=' + record.data.player_id,
                        });
                        storeInfo.on('load', function() {
                            if(storeInfo.getCount()>1){
                                document.getElementById('countData').innerHTML = 'У игрока было ' + storeInfo.getCount() + ' контракта с командой';
                            }
                            else{
                                document.getElementById('countData').innerHTML = 'У игрока был ' + storeInfo.getCount() + ' контракт с командой';
                            }
                        });

                        document.getElementById('selClient').innerHTML = 'Выбран игрок ' + record.data.player_name;

                    }
                }
            }
        });
    
        gridInfo = Ext.create('Ext.grid.Panel', {
            title: 'Информация о контрактах игрока в данной команде',
            region: 'center',
            store: storeInfo,
            height: 200,
            renderTo: document.body,
            columns: [
                { header: 'Команда', width: 100, dataIndex: 'c_team' },
                { header: 'Лет в команде', width: 100, dataIndex: 'c_year' }
            ],
            viewConfig: {
                stripeRows: true
            }
        });
    }
});