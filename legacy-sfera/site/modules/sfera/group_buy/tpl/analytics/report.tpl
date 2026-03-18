<div class="analytics-report">
    <div class="report-header">
        <h3>Отчет по групповым покупкам</h3>
        <div class="report-filters">
            <div class="form-group">
                <label>Период</label>
                <select class="form-control" data-bind="value: period">
                    <option value="today">Сегодня</option>
                    <option value="week">Неделя</option>
                    <option value="month">Месяц</option>
                    <option value="year">Год</option>
                    <option value="custom">Произвольный</option>
                </select>
            </div>
            
            <div class="form-group" data-bind="visible: period() === 'custom'">
                <label>С</label>
                <input type="date" class="form-control" data-bind="value: startDate">
            </div>
            
            <div class="form-group" data-bind="visible: period() === 'custom'">
                <label>По</label>
                <input type="date" class="form-control" data-bind="value: endDate">
            </div>
            
            <button class="btn btn-primary" data-bind="click: loadReport">
                Применить
            </button>
        </div>
    </div>
    
    <div class="report-metrics">
        <div class="metric-card">
            <div class="metric-icon">
                <i class="fas fa-shopping-cart"></i>
            </div>
            <div class="metric-content">
                <div class="metric-value" data-bind="text: metrics.totalGroupBuys"></div>
                <div class="metric-label">Всего покупок</div>
                <div class="metric-change" data-bind="css: { positive: metrics.groupBuysChange > 0, negative: metrics.groupBuysChange < 0 }">
                    <i class="fas" data-bind="css: metrics.groupBuysChange > 0 ? 'fa-arrow-up' : 'fa-arrow-down'"></i>
                    <span data-bind="text: Math.abs(metrics.groupBuysChange) + '%'"></span>
                </div>
            </div>
        </div>
        
        <div class="metric-card">
            <div class="metric-icon">
                <i class="fas fa-users"></i>
            </div>
            <div class="metric-content">
                <div class="metric-value" data-bind="text: metrics.totalParticipants"></div>
                <div class="metric-label">Участников</div>
                <div class="metric-change" data-bind="css: { positive: metrics.participantsChange > 0, negative: metrics.participantsChange < 0 }">
                    <i class="fas" data-bind="css: metrics.participantsChange > 0 ? 'fa-arrow-up' : 'fa-arrow-down'"></i>
                    <span data-bind="text: Math.abs(metrics.participantsChange) + '%'"></span>
                </div>
            </div>
        </div>
        
        <div class="metric-card">
            <div class="metric-icon">
                <i class="fas fa-ruble-sign"></i>
            </div>
            <div class="metric-content">
                <div class="metric-value" data-bind="text: formatMoney(metrics.totalRevenue)"></div>
                <div class="metric-label">Выручка</div>
                <div class="metric-change" data-bind="css: { positive: metrics.revenueChange > 0, negative: metrics.revenueChange < 0 }">
                    <i class="fas" data-bind="css: metrics.revenueChange > 0 ? 'fa-arrow-up' : 'fa-arrow-down'"></i>
                    <span data-bind="text: Math.abs(metrics.revenueChange) + '%'"></span>
                </div>
            </div>
        </div>
        
        <div class="metric-card">
            <div class="metric-icon">
                <i class="fas fa-percentage"></i>
            </div>
            <div class="metric-content">
                <div class="metric-value" data-bind="text: metrics.completionRate + '%'"></div>
                <div class="metric-label">Успешность</div>
                <div class="metric-change" data-bind="css: { positive: metrics.completionRateChange > 0, negative: metrics.completionRateChange < 0 }">
                    <i class="fas" data-bind="css: metrics.completionRateChange > 0 ? 'fa-arrow-up' : 'fa-arrow-down'"></i>
                    <span data-bind="text: Math.abs(metrics.completionRateChange) + '%'"></span>
                </div>
            </div>
        </div>
    </div>
    
    <div class="report-charts">
        <div class="chart-container">
            <h4>Динамика групповых покупок</h4>
            <canvas id="groupBuysChart"></canvas>
        </div>
        
        <div class="chart-container">
            <h4>Распределение по категориям</h4>
            <canvas id="categoriesChart"></canvas>
        </div>
    </div>
    
    <div class="report-table">
        <h4>Топ товаров</h4>
        <table class="table">
            <thead>
                <tr>
                    <th>Товар</th>
                    <th>Количество покупок</th>
                    <th>Участников</th>
                    <th>Выручка</th>
                    <th>Успешность</th>
                </tr>
            </thead>
            <tbody data-bind="foreach: topProducts">
                <tr>
                    <td>
                        <div class="product-info">
                            <img data-bind="attr: { src: image }" alt="">
                            <div>
                                <div class="product-name" data-bind="text: name"></div>
                                <div class="product-category" data-bind="text: category"></div>
                            </div>
                        </div>
                    </td>
                    <td data-bind="text: groupBuys"></td>
                    <td data-bind="text: participants"></td>
                    <td data-bind="text: formatMoney(revenue)"></td>
                    <td>
                        <div class="progress">
                            <div class="progress-bar" data-bind="style: { width: completionRate + '%' }"></div>
                        </div>
                        <span data-bind="text: completionRate + '%'"></span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<style>
.analytics-report {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    padding: 1.5rem;
}

.report-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
}

.report-header h3 {
    margin: 0;
    font-size: 1.5rem;
    font-weight: 600;
}

.report-filters {
    display: flex;
    align-items: flex-end;
    gap: 1rem;
}

.report-metrics {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1.5rem;
    margin-bottom: 2rem;
}

.metric-card {
    background: #f8f9fa;
    border-radius: 8px;
    padding: 1.5rem;
    display: flex;
    align-items: center;
}

.metric-icon {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    background: #e9ecef;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 1rem;
}

.metric-icon i {
    font-size: 1.5rem;
    color: #6c757d;
}

.metric-content {
    flex: 1;
}

.metric-value {
    font-size: 1.5rem;
    font-weight: 600;
    margin-bottom: 0.25rem;
}

.metric-label {
    color: #6c757d;
    font-size: 0.9rem;
    margin-bottom: 0.5rem;
}

.metric-change {
    font-size: 0.8rem;
    display: flex;
    align-items: center;
    gap: 0.25rem;
}

.metric-change.positive {
    color: #28a745;
}

.metric-change.negative {
    color: #dc3545;
}

.report-charts {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
    gap: 1.5rem;
    margin-bottom: 2rem;
}

.chart-container {
    background: #f8f9fa;
    border-radius: 8px;
    padding: 1.5rem;
}

.chart-container h4 {
    margin: 0 0 1rem;
    font-size: 1.1rem;
    font-weight: 600;
}

.report-table {
    background: #f8f9fa;
    border-radius: 8px;
    padding: 1.5rem;
}

.report-table h4 {
    margin: 0 0 1rem;
    font-size: 1.1rem;
    font-weight: 600;
}

.product-info {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.product-info img {
    width: 40px;
    height: 40px;
    border-radius: 4px;
    object-fit: cover;
}

.product-name {
    font-weight: 500;
    margin-bottom: 0.25rem;
}

.product-category {
    font-size: 0.8rem;
    color: #6c757d;
}

.progress {
    height: 6px;
    background: #e9ecef;
    border-radius: 3px;
    margin-bottom: 0.25rem;
}

.progress-bar {
    background: #007bff;
    border-radius: 3px;
}

@media (max-width: 768px) {
    .report-header {
        flex-direction: column;
        align-items: stretch;
        gap: 1rem;
    }
    
    .report-filters {
        flex-wrap: wrap;
    }
    
    .report-charts {
        grid-template-columns: 1fr;
    }
    
    .table {
        display: block;
        overflow-x: auto;
    }
}
</style>

<script>
function AnalyticsReportViewModel() {
    var self = this;
    
    self.period = ko.observable('week');
    self.startDate = ko.observable('');
    self.endDate = ko.observable('');
    
    self.metrics = ko.observable({
        totalGroupBuys: 0,
        groupBuysChange: 0,
        totalParticipants: 0,
        participantsChange: 0,
        totalRevenue: 0,
        revenueChange: 0,
        completionRate: 0,
        completionRateChange: 0
    });
    
    self.topProducts = ko.observableArray([]);
    
    self.formatMoney = function(amount) {
        return new Intl.NumberFormat('ru-RU', {
            style: 'currency',
            currency: 'RUB'
        }).format(amount);
    };
    
    self.loadReport = function() {
        var params = {
            period: self.period()
        };
        
        if (self.period() === 'custom') {
            params.start_date = self.startDate();
            params.end_date = self.endDate();
        }
        
        $.get('/api/analytics/group-buys', params).done(function(response) {
            self.metrics(response.metrics);
            self.topProducts(response.top_products);
            
            // Обновление графиков
            self.updateCharts(response.charts);
        });
    };
    
    self.updateCharts = function(data) {
        // График динамики
        var groupBuysCtx = document.getElementById('groupBuysChart').getContext('2d');
        new Chart(groupBuysCtx, {
            type: 'line',
            data: {
                labels: data.dynamics.labels,
                datasets: [{
                    label: 'Групповые покупки',
                    data: data.dynamics.values,
                    borderColor: '#007bff',
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });
        
        // График категорий
        var categoriesCtx = document.getElementById('categoriesChart').getContext('2d');
        new Chart(categoriesCtx, {
            type: 'doughnut',
            data: {
                labels: data.categories.labels,
                datasets: [{
                    data: data.categories.values,
                    backgroundColor: [
                        '#007bff',
                        '#28a745',
                        '#ffc107',
                        '#dc3545',
                        '#6c757d'
                    ]
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });
    };
    
    // Инициализация
    self.loadReport();
}

ko.applyBindings(new AnalyticsReportViewModel());
</script> 