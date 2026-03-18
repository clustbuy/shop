<div class="notifications-center">
    <div class="notifications-header">
        <h3>Групповые покупки</h3>
        <div class="notifications-actions">
            <button class="btn btn-sm btn-outline-primary" data-bind="click: markAllAsRead">
                Отметить все как прочитанные
            </button>
        </div>
    </div>
    
    <div class="notifications-list" data-bind="foreach: notifications">
        <div class="notification-item" data-bind="css: { unread: !isRead }">
            <div class="notification-icon">
                <i class="fas" data-bind="css: iconClass"></i>
            </div>
            
            <div class="notification-content">
                <div class="notification-title" data-bind="text: title"></div>
                <div class="notification-text" data-bind="html: text"></div>
                <div class="notification-meta">
                    <span class="notification-time" data-bind="text: timeAgo"></span>
                    <span class="notification-status" data-bind="text: status"></span>
                </div>
            </div>
            
            <div class="notification-actions">
                <button class="btn btn-sm btn-link" data-bind="click: markAsRead, visible: !isRead">
                    <i class="fas fa-check"></i>
                </button>
                <button class="btn btn-sm btn-link" data-bind="click: $parent.removeNotification">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        </div>
    </div>
    
    <div class="notifications-empty" data-bind="visible: notifications().length === 0">
        <i class="fas fa-bell-slash"></i>
        <p>Нет новых уведомлений</p>
    </div>
    
    <div class="notifications-footer" data-bind="visible: hasMore">
        <button class="btn btn-link" data-bind="click: loadMore">
            Загрузить еще
        </button>
    </div>
</div>

<style>
.notifications-center {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.notifications-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem;
    border-bottom: 1px solid #eee;
}

.notifications-header h3 {
    margin: 0;
    font-size: 1.1rem;
    font-weight: 600;
}

.notifications-list {
    max-height: 400px;
    overflow-y: auto;
}

.notification-item {
    display: flex;
    align-items: flex-start;
    padding: 1rem;
    border-bottom: 1px solid #eee;
    transition: background-color 0.2s;
}

.notification-item:hover {
    background-color: #f8f9fa;
}

.notification-item.unread {
    background-color: #f0f7ff;
}

.notification-icon {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background-color: #e9ecef;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 1rem;
}

.notification-icon i {
    font-size: 1.2rem;
    color: #6c757d;
}

.notification-content {
    flex: 1;
    min-width: 0;
}

.notification-title {
    font-weight: 600;
    margin-bottom: 0.25rem;
}

.notification-text {
    color: #6c757d;
    font-size: 0.9rem;
    margin-bottom: 0.5rem;
}

.notification-meta {
    display: flex;
    align-items: center;
    font-size: 0.8rem;
    color: #adb5bd;
}

.notification-time {
    margin-right: 1rem;
}

.notification-status {
    padding: 0.25rem 0.5rem;
    border-radius: 4px;
    background-color: #e9ecef;
}

.notification-actions {
    display: flex;
    align-items: center;
    margin-left: 1rem;
}

.notification-actions .btn-link {
    color: #adb5bd;
    padding: 0.25rem;
}

.notification-actions .btn-link:hover {
    color: #6c757d;
}

.notifications-empty {
    padding: 2rem;
    text-align: center;
    color: #adb5bd;
}

.notifications-empty i {
    font-size: 2rem;
    margin-bottom: 1rem;
}

.notifications-footer {
    padding: 1rem;
    text-align: center;
    border-top: 1px solid #eee;
}

@media (max-width: 576px) {
    .notification-item {
        padding: 0.75rem;
    }
    
    .notification-icon {
        width: 32px;
        height: 32px;
        margin-right: 0.75rem;
    }
    
    .notification-icon i {
        font-size: 1rem;
    }
    
    .notification-text {
        font-size: 0.85rem;
    }
    
    .notification-meta {
        font-size: 0.75rem;
    }
}
</style>

<script>
function NotificationsCenterViewModel() {
    var self = this;
    
    self.notifications = ko.observableArray([]);
    self.isRead = ko.observable(false);
    self.hasMore = ko.observable(false);
    self.page = ko.observable(1);
    
    self.loadNotifications = function() {
        $.get('/api/notifications/group-buy', {
            page: self.page(),
            per_page: 20
        }).done(function(response) {
            if (response.notifications) {
                self.notifications.push.apply(self.notifications, response.notifications);
                self.hasMore(response.has_more);
            }
        });
    };
    
    self.loadMore = function() {
        self.page(self.page() + 1);
        self.loadNotifications();
    };
    
    self.markAsRead = function(notification) {
        $.post('/api/notifications/mark-read', {
            id: notification.id
        }).done(function() {
            notification.isRead(true);
        });
    };
    
    self.markAllAsRead = function() {
        $.post('/api/notifications/mark-all-read', {
            type: 'group-buy'
        }).done(function() {
            self.notifications().forEach(function(notification) {
                notification.isRead(true);
            });
        });
    };
    
    self.removeNotification = function(notification) {
        $.post('/api/notifications/remove', {
            id: notification.id
        }).done(function() {
            self.notifications.remove(notification);
        });
    };
    
    // Инициализация
    self.loadNotifications();
}

ko.applyBindings(new NotificationsCenterViewModel());
</script> 