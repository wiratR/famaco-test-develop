```bash
lib/
├── config/
│   └── config.dart            # AppConfig class that reads from .env
├── controllers/
│   └── auth_controller.dart
├── models/
│   └── user_model.dart
├── services/
│   └── auth_service.dart
├── views/
│   ├── login_view.dart
│   └── register_view.dart
└── main.dart

.env                        # Default environment (e.g., production)
.env.dev                    # Development environment
.env.staging                # Staging environment
.env.prod                   # Production environment
pubspec.yaml
```