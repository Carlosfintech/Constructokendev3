# Active Context - Constructoken

## 1. Estado Actual del Proyecto

- **Fase de Desarrollo:** MVP en proceso, centrado en los módulos principales: Inicio de Sesión, Marketplace, Proyectos, Wallet y Créditos.
- **Componentes en Desarrollo:**  
  App para Constructores
  - Inicio de sesión (autenticación, registro y recuperación de contraseña).
  - Módulo de Marketplace con cálculo dinámico de costos de envío y seguimiento de pedidos.
  - Módulo de Proyectos, enfocado en la planificación y estimación en tiempo real.
  - Integración de la billetera digital (Wallet) y sistema de créditos, con API de FINSUS.

## 2. Decisiones Recientes

- **Arquitectura:** Se optó por un backend en FastAPI que unifica la lógica de negocio, autenticación y acceso a la BD, mientras que Next.js y Flutter se utilizarán para el frontend y la app móvil, respectivamente.
- **Integración de Servicios Financieros:** Aprobada la integración con FINSUS para la cuenta digital y métodos de pago.
- **Estándares de Seguridad:** Implementación de autenticación vía JWT y políticas de expiración de tokens.

## 3. Tareas y Cambios Pendientes

- Terminar la configuracion inicial
- Programar los componentes de la app de constructores.

## 4. Próximos Pasos

-Hacer el modulo de inicio de sesion y registro 