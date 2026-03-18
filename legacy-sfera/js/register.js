// Register Page JavaScript

const registerForm = document.getElementById('registerForm');
const nameInput = document.getElementById('name');
const phoneInput = document.getElementById('phone');
const passwordInput = document.getElementById('password');
const confirmPasswordInput = document.getElementById('confirmPassword');
const termsCheckbox = document.getElementById('terms');
const strengthFill = document.getElementById('strengthFill');
const strengthText = document.getElementById('strengthText');

// Phone mask
phoneInput.addEventListener('input', (e) => {
    let value = e.target.value.replace(/\D/g, '');
    
    if (value.length > 0) {
        if (value[0] === '8') value = '7' + value.substring(1);
        if (value[0] !== '7') value = '7' + value;
    }
    
    let formattedValue = '';
    if (value.length > 0) {
        formattedValue = '+7';
        if (value.length > 1) {
            formattedValue += ' (' + value.substring(1, 4);
        }
        if (value.length >= 5) {
            formattedValue += ') ' + value.substring(4, 7);
        }
        if (value.length >= 8) {
            formattedValue += '-' + value.substring(7, 9);
        }
        if (value.length >= 10) {
            formattedValue += '-' + value.substring(9, 11);
        }
    }
    
    e.target.value = formattedValue;
});

// Allow email or phone
phoneInput.addEventListener('blur', (e) => {
    const value = e.target.value;
    // If it contains @, treat as email, otherwise as phone
    if (value.includes('@')) {
        e.target.type = 'email';
    } else {
        e.target.type = 'tel';
    }
});

// Password strength checker
passwordInput.addEventListener('input', (e) => {
    const password = e.target.value;
    const strength = checkPasswordStrength(password);
    
    strengthFill.className = 'strength-fill';
    strengthText.className = 'strength-text';
    
    if (password.length === 0) {
        strengthText.textContent = '';
        return;
    }
    
    if (strength < 3) {
        strengthFill.classList.add('weak');
        strengthText.classList.add('weak');
        strengthText.textContent = 'Слабый пароль';
    } else if (strength < 4) {
        strengthFill.classList.add('medium');
        strengthText.classList.add('medium');
        strengthText.textContent = 'Средний пароль';
    } else {
        strengthFill.classList.add('strong');
        strengthText.classList.add('strong');
        strengthText.textContent = 'Надёжный пароль';
    }
});

function checkPasswordStrength(password) {
    let strength = 0;
    
    if (password.length >= 8) strength++;
    if (password.length >= 12) strength++;
    if (/[a-z]/.test(password) && /[A-Z]/.test(password)) strength++;
    if (/\d/.test(password)) strength++;
    if (/[^a-zA-Z0-9]/.test(password)) strength++;
    
    return strength;
}

// Password visibility toggle
document.querySelectorAll('.toggle-password').forEach(button => {
    button.addEventListener('click', () => {
        const targetId = button.dataset.target;
        const input = document.getElementById(targetId);
        
        if (input.type === 'password') {
            input.type = 'text';
            button.querySelector('.eye-icon').innerHTML = `
                <path d="M3 10s2.5-5 7-5 7 5 7 5-2.5 5-7 5-7-5-7-5z" stroke="currentColor" stroke-width="1.5" fill="none"/>
                <circle cx="10" cy="10" r="2.5" stroke="currentColor" stroke-width="1.5" fill="none"/>
                <line x1="2" y1="2" x2="18" y2="18" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/>
            `;
        } else {
            input.type = 'password';
            button.querySelector('.eye-icon').innerHTML = `
                <path d="M10 4C5 4 1.73 7.11 1 10c.73 2.89 4 6 9 6s8.27-3.11 9-6c-.73-2.89-4-6-9-6zm0 10a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm0-6.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5z" fill="currentColor"/>
            `;
        }
    });
});

// Form validation
function validateField(input) {
    const formGroup = input.closest('.form-group');
    const errorMessage = formGroup.querySelector('.error-message');
    
    let isValid = true;
    let message = '';
    
    if (input.hasAttribute('required') && !input.value.trim()) {
        isValid = false;
        message = 'Это поле обязательно для заполнения';
    }
    
    if (input.id === 'name' && input.value.trim().length < 2) {
        isValid = false;
        message = 'Имя должно содержать минимум 2 символа';
    }
    
    if (input.id === 'phone' && input.value.trim()) {
        const hasAt = input.value.includes('@');
        if (!hasAt) {
            // Phone validation
            const phoneDigits = input.value.replace(/\D/g, '');
            if (phoneDigits.length !== 11) {
                isValid = false;
                message = 'Введите корректный номер телефона';
            }
        } else {
            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(input.value)) {
                isValid = false;
                message = 'Введите корректный email';
            }
        }
    }
    
    if (input.id === 'password' && input.value) {
        if (input.value.length < 6) {
            isValid = false;
            message = 'Пароль должен содержать минимум 6 символов';
        }
    }
    
    if (input.id === 'confirmPassword' && input.value) {
        if (input.value !== passwordInput.value) {
            isValid = false;
            message = 'Пароли не совпадают';
        }
    }
    
    if (input.type === 'checkbox' && input.hasAttribute('required') && !input.checked) {
        isValid = false;
        message = 'Необходимо согласиться с условиями';
    }
    
    if (isValid) {
        input.classList.remove('error');
        errorMessage.textContent = '';
    } else {
        input.classList.add('error');
        errorMessage.textContent = message;
    }
    
    return isValid;
}

// Real-time validation
[nameInput, phoneInput, passwordInput, confirmPasswordInput, termsCheckbox].forEach(input => {
    input.addEventListener('blur', () => validateField(input));
    input.addEventListener('input', () => {
        if (input.classList.contains('error')) {
            validateField(input);
        }
    });
});

// Form submission
registerForm.addEventListener('submit', async (e) => {
    e.preventDefault();
    
    // Validate all fields
    const fields = [nameInput, phoneInput, passwordInput, confirmPasswordInput, termsCheckbox];
    let isFormValid = true;
    
    fields.forEach(field => {
        if (!validateField(field)) {
            isFormValid = false;
        }
    });
    
    if (!isFormValid) {
        showNotification('Пожалуйста, исправьте ошибки в форме', 'error');
        return;
    }
    
    // Get form data
    const formData = {
        name: nameInput.value.trim(),
        contact: phoneInput.value.trim(),
        password: passwordInput.value,
        terms: termsCheckbox.checked,
        newsletter: document.getElementById('newsletter').checked
    };
    
    // Disable submit button
    const submitBtn = registerForm.querySelector('.btn-submit');
    submitBtn.disabled = true;
    submitBtn.textContent = 'Регистрация...';
    
    try {
        // Simulate API call
        await new Promise(resolve => setTimeout(resolve, 1500));
        
        // Success
        showNotification('Регистрация успешна! Перенаправляем...', 'success');
        
        // Store user data (in real app, this would come from server)
        localStorage.setItem('user', JSON.stringify({
            name: formData.name,
            contact: formData.contact
        }));
        
        // Redirect to login or home page
        setTimeout(() => {
            window.location.href = '/index.html';
        }, 2000);
        
    } catch (error) {
        showNotification('Ошибка регистрации. Попробуйте еще раз', 'error');
        submitBtn.disabled = false;
        submitBtn.textContent = 'Зарегистрироваться';
    }
});

// Social login buttons
document.querySelectorAll('.social-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        const provider = btn.classList.contains('google-btn') ? 'Google' :
                        btn.classList.contains('vk-btn') ? 'VK' : 'Telegram';
        
        showNotification(`Регистрация через ${provider} временно недоступна`, 'info');
    });
});

// Notification system
function showNotification(message, type = 'info') {
    const existing = document.querySelector('.notification');
    if (existing) {
        existing.remove();
    }
    
    const notification = document.createElement('div');
    notification.className = 'notification';
    notification.textContent = message;
    
    const colors = {
        success: '#00a859',
        error: '#ff1744',
        info: '#005bff'
    };
    
    Object.assign(notification.style, {
        position: 'fixed',
        bottom: '24px',
        right: '24px',
        background: colors[type] || colors.info,
        color: '#ffffff',
        padding: '16px 24px',
        borderRadius: '8px',
        fontSize: '14px',
        fontWeight: '500',
        zIndex: '10000',
        boxShadow: '0 4px 16px rgba(0, 0, 0, 0.2)',
        animation: 'slideIn 0.3s ease',
        maxWidth: '400px'
    });
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.style.animation = 'slideOut 0.3s ease';
        setTimeout(() => notification.remove(), 300);
    }, 4000);
}

// Add animation styles
const style = document.createElement('style');
style.textContent = `
    @keyframes slideIn {
        from {
            transform: translateX(400px);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }
    
    @keyframes slideOut {
        from {
            transform: translateX(0);
            opacity: 1;
        }
        to {
            transform: translateX(400px);
            opacity: 0;
        }
    }
`;
document.head.appendChild(style);

console.log('Register page loaded successfully');
