# Tech Context - Constructoken

## 1. Backend

- **Framework:** FastAPI (Python)
- **Autenticación:** JWT/OAuth2
- **ORM y Base de Datos:** SQLAlchemy con Alembic para migraciones; Base de Datos PostgreSQL.
- **Infraestructura:** Docker y Docker Compose para contenedorización; despliegue en plataformas como Render.
- **Lenguajes y Herramientas:** Python 3.x, pytest para testing, Git para control de versiones.

## 2. Frontend Web

- **Framework:** Next.js (React con TypeScript)
- **Librerías y Herramientas:** ESLint, Prettier, Jest y React Testing Library para testing; integración con APIs REST del backend.
- **Infraestructura:** Despliegue en plataformas como Vercel o mediante contenedores en Docker.

## 3. Aplicación Móvil

- **Framework:** Flutter (usando very_good_cli)
- **Arquitectura:** Clean Architecture y DDD
- **Estado y Gestión de Datos:** Provider/Bloc o Riverpod (según se defina en la implementación)
- **Testing:** Flutter test para unidades y widgets.

## 4. Integraciones Adicionales

- **Servicios Financieros:** Integración con API de FINSUS para manejo de Wallet y transacciones.
- **Pasarelas de Pago:** Integración con tarjetas de débito/crédito, SPEI y otros métodos mediante servicios externos.
- **Servicios de Contexto:** Uso del panel de chat de Cursor y técnicas de Memory Bank para integrar documentación y contexto de la aplicación.

## 5. Herramientas de Desarrollo

- **IDE/Editor:** Visual Studio Code, PyCharm, Android Studio.
- **Contenedorización y Orquestación:** Docker, Docker Compose.
- **CI/CD:** GitHub Actions u otra herramienta de integración continua.
- **Control de Versiones:** Git (con repositorio en GitHub o similar).

## 6. Configuración y Dependencias

- **Archivos de Configuración:**
  - `cursor_config.json` para la gestión del contexto y configuración del cursor.
  - `.env` para variables de entorno sensibles.
- **Gestión de Dependencias:**
  - Python: requirements.txt o pyproject.toml.
  - Next.js: package.json.
  - Flutter: pubspec.yaml.