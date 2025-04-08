# Project Brief - Constructoken

## 1. Visión General

Constructoken es una plataforma tecnológica que busca facilitar la construcción de viviendas de manera autogestiva en México. Actúa como un marketplace integral que conecta a autoproductores de vivienda y migrantes mexicanos con servicios financieros y no financieros, permitiendo la compra de materiales y contratación de servicios para construir, ampliar o remodelar una vivienda.

La idea central es democratizar el acceso a la construcción, ofreciendo herramientas que hagan rentable y transparente el proceso. La plataforma permite desarrollar proyectos de vivienda progresiva, donde la construcción se puede realizar en etapas, pagando total o parcialmente según el producto financiero seleccionado.

⸻

## 2. Objetivos del Proyecto
- **Facilitar la construcción de vivienda**: Brindar a usuarios sin acceso a financiamiento formal (debido a la informalidad o historial crediticio) la posibilidad de construir a través de alternativas de pago y ahorro progresivo.
- **Integrar servicios financieros y no financieros**: Ofrecer un ecosistema donde se pueda, no solo adquirir materiales de construcción, sino también gestionar productos financieros (ej. FINSUS) para soportar el financiamiento de la construcción.
- **Optimizar el proceso de construcción**: Permitir a los usuarios calcular y visualizar el proyecto en etapas, obteniendo estimaciones de costos y gestionando cada fase de la obra.

⸻

## 3. Público Objetivo
- **Constructor**: Personas interesadas en construir, ampliar o remodelar su vivienda, tanto residentes en México como migrantes que envían dinero para la construcción.
- **Tiendas de Materiales**: Proveedores especializados que gestionan pedidos, manejo de inventarios y venta directa.
- **Administrador**: Personal encargado de gestionar y dar soporte a la plataforma, coordinando la operación de los diferentes módulos.

⸻

## 4. Funcionalidades Clave

### 4.1 Módulo App para Constructores
- **Inicio de Sesión y Registro**: Acceso mediante correo, teléfono o integración con Google. Se gestionan tokens de autenticación (JWT/OAuth2) para sesiones seguras.
- **Recuperación de Contraseña**: Envío de código o enlace para resetear la contraseña.
- **Gestión del Perfil y Cuenta**: Edición de datos, ubicación y soporte.

### 4.2 Marketplace
- **Selección de Ubicación**: Permite filtrar tiendas, productos y servicios en función de la zona del usuario.
- **Compras y Pedidos**: Desde la selección de productos hasta el cálculo dinámico del costo de envío, con métodos de pago múltiples (tarjeta, SPEI, Wallet, créditos) y seguimiento de pedidos en tiempo real.

### 4.3 Módulo Proyectos
- **Diseño y Planificación**: Los usuarios pueden configurar proyectos (construcción, ampliación, remodelación o proyectos personalizados) eligiendo características, materiales, acabados y dividiendo la obra en etapas.
- **Estimaciones de Costos**: Cálculo en tiempo real que desglosa mano de obra, materiales y herramientas, integrándose con el catálogo de precios del marketplace.
- **Generación de Documentos**: Creación de resúmenes y cronogramas en formato PDF para consulta y seguimiento.

### 4.4 Wallet y Créditos
- **Billetera Digital**: Permite administrar dinero para pagos de materiales y servicios, con integración a una cuenta real (FINSUS) que ofrece tasas de interés y diferentes métodos de depósito.
- **Módulo de Créditos**: Gestiona la contratación y seguimiento de préstamos, con estrategias para la devolución de intereses y pago automático desde la cuenta Wallet.

⸻

## 5. Integraciones y Tecnologías
- **Integración Financiera con FINSUS**: Cuenta virtual vinculada a una entidad financiera regulada, con tasas de rendimiento y métodos de pago (tarjeta, CLABE, SPEI).
- **Pasarela de Pagos**: Permite el pago seguro mediante tarjetas y otros métodos.
- **Base de Datos y ORM**: Uso de PostgreSQL con SQLAlchemy y migraciones gestionadas por Alembic, siguiendo el diseño definido en la base de datos.
- **Infraestructura Multicanal**:
  - **Backend**: FastAPI en Python, con autenticación JWT/OAuth2.
  - **Frontend Web**: Next.js para la aplicación web, consumiendo la API del backend.
  - **App Móvil**: Flutter (usando very_good_cli) para aplicaciones nativas en Android e iOS.
- **Contenedorización**: Despliegue y orquestación mediante Docker y Docker Compose.

⸻

## 6. Organización del Repositorio

El proyecto se organiza en módulos claramente definidos:
- **Backend**: Código en FastAPI (modelo, rutas, servicios, migraciones).
- **Web**: Aplicación Next.js orientada a consumir la API.
- **App**: Aplicación Flutter que se comunica con el backend.
- **Docs**: Documentación técnica y estratégica (incluyendo este archivo, plantillas de planificación, etc.).

Esta estructura modular facilita la escalabilidad, el mantenimiento y la integración de nuevas funcionalidades conforme crece el ecosistema de Constructoken.

⸻

## 7. Consideraciones Finales
- **Escalabilidad y Flexibilidad**: La plataforma está diseñada para crecer y adaptarse, permitiendo añadir nuevas funcionalidades, integraciones y mejorar continuamente la experiencia del usuario.
- **Enfoque en la Experiencia del Usuario**: Todo el proceso desde la planificación del proyecto hasta la ejecución del mismo se centra en ofrecer una experiencia transparente y confiable, respaldada por un robusto sistema de gestión financiera y logística.
- **Innovación y Mejora Continua**: Se contempla el uso de técnicas avanzadas (como Machine Learning para predecir costos y actualización dinámica del carrito) y la implementación de un Memory Bank para mejorar la gestión del contexto en cada sesión de usuario. 