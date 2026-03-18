var GroupBuyModel = {
    groupBuy: ko.observable(null),
    participants: ko.observableArray([]),
    isLoading: ko.observable(false),
    error: ko.observable(null),
    
    // Загрузка данных групповой покупки
    loadGroupBuy: function(groupId) {
        this.isLoading(true);
        this.error(null);
        
        $.ajax({
            url: '/api/group_buy/' + groupId,
            method: 'GET',
            success: (response) => {
                if (response.success) {
                    this.groupBuy(response.data);
                    this.participants(response.data.participants);
                } else {
                    this.error(response.message);
                }
            },
            error: (xhr) => {
                this.error('Ошибка при загрузке данных групповой покупки');
            },
            complete: () => {
                this.isLoading(false);
            }
        });
    },
    
    // Присоединение к групповой покупке
    joinGroup: function(groupId) {
        this.isLoading(true);
        this.error(null);
        
        $.ajax({
            url: '/api/group_buy/' + groupId + '/join',
            method: 'POST',
            success: (response) => {
                if (response.success) {
                    this.loadGroupBuy(groupId);
                } else {
                    this.error(response.message);
                }
            },
            error: (xhr) => {
                this.error('Ошибка при присоединении к групповой покупке');
            },
            complete: () => {
                this.isLoading(false);
            }
        });
    },
    
    // Выход из групповой покупки
    leaveGroup: function(groupId) {
        this.isLoading(true);
        this.error(null);
        
        $.ajax({
            url: '/api/group_buy/' + groupId + '/leave',
            method: 'POST',
            success: (response) => {
                if (response.success) {
                    this.loadGroupBuy(groupId);
                } else {
                    this.error(response.message);
                }
            },
            error: (xhr) => {
                this.error('Ошибка при выходе из групповой покупки');
            },
            complete: () => {
                this.isLoading(false);
            }
        });
    },
    
    // Завершение групповой покупки
    completeGroup: function(groupId) {
        this.isLoading(true);
        this.error(null);
        
        $.ajax({
            url: '/api/group_buy/' + groupId + '/complete',
            method: 'POST',
            success: (response) => {
                if (response.success) {
                    this.loadGroupBuy(groupId);
                } else {
                    this.error(response.message);
                }
            },
            error: (xhr) => {
                this.error('Ошибка при завершении групповой покупки');
            },
            complete: () => {
                this.isLoading(false);
            }
        });
    },
    
    // Создание новой групповой покупки
    createGroupBuy: function(data) {
        this.isLoading(true);
        this.error(null);
        
        $.ajax({
            url: '/api/group_buy/create',
            method: 'POST',
            data: data,
            success: (response) => {
                if (response.success) {
                    window.location.href = '/group_buy/view/' + response.data.id;
                } else {
                    this.error(response.message);
                }
            },
            error: (xhr) => {
                this.error('Ошибка при создании групповой покупки');
            },
            complete: () => {
                this.isLoading(false);
            }
        });
    },
    
    // Получение списка активных групповых покупок
    getActiveGroupBuys: function() {
        this.isLoading(true);
        this.error(null);
        
        $.ajax({
            url: '/api/group_buy/active',
            method: 'GET',
            success: (response) => {
                if (response.success) {
                    this.groupBuys(response.data);
                } else {
                    this.error(response.message);
                }
            },
            error: (xhr) => {
                this.error('Ошибка при загрузке списка групповых покупок');
            },
            complete: () => {
                this.isLoading(false);
            }
        });
    },
    
    // Вычисляемые свойства
    progress: ko.computed(function() {
        if (!this.groupBuy()) return 0;
        return (this.groupBuy().current_participants / this.groupBuy().min_participants) * 100;
    }, this),
    
    timeLeft: ko.computed(function() {
        if (!this.groupBuy()) return '';
        const endDate = new Date(this.groupBuy().end_date);
        const now = new Date();
        const diff = endDate - now;
        
        if (diff <= 0) return 'Завершено';
        
        const days = Math.floor(diff / (1000 * 60 * 60 * 24));
        const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
        
        return `${days}д ${hours}ч ${minutes}м`;
    }, this),
    
    savings: ko.computed(function() {
        if (!this.groupBuy()) return 0;
        return this.groupBuy().product.price - this.groupBuy().group_price;
    }, this),
    
    savingsPercent: ko.computed(function() {
        if (!this.groupBuy()) return 0;
        return Math.round((this.savings() / this.groupBuy().product.price) * 100);
    }, this)
}; 