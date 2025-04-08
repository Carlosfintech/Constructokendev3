BD 1.1

	1.	MÓDULO MARKETPLACE
1.1 Usuarios
Contiene a todos los actores del sistema, con roles ampliados.
●	id_usuario: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	nombre: VARCHAR(100), NOT NULL
●	email: VARCHAR(150), UNIQUE, NOT NULL
●	password: VARCHAR(255), NOT NULL
●	rol: ENUM(‘constructor’, ‘comprador’, ‘vendedor’, ‘tienda_material’, ‘admin’), NOT NULL
●	fecha_registro: DATETIME, DEFAULT CURRENT_TIMESTAMP
●	teléfono: VARCHAR(20), NOT NULL
1.2 Productos
Artículos que se ofrecen en el marketplace.
●	id_producto: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	nombre: VARCHAR(150), NOT NULL
●	descripcion: TEXT
●	precio: DECIMAL(10,2), NOT NULL
●	stock: INT, DEFAULT 0
●	id_categoria: INT (FK → Categorías)
●	id_vendedor: INT (FK → Usuarios)
●	fecha_publicacion: DATETIME, DEFAULT CURRENT_TIMESTAMP
●	tipo_producto: ENUM(‘producto’, ‘lote’, ‘servicio_construccion’)
●	id_materiales_servicios: INT (FK → Materiales_Servicios)
1.3 Órdenes (Pedidos)
Registra cada compra. Se amplía para incluir pedidos de materiales y ventas directas.
●	id_orden: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_cliente: INT (FK → Usuarios; constructor o tienda)
●	fecha_orden: DATETIME, DEFAULT CURRENT_TIMESTAMP
●	estado: ENUM(‘pendiente’, ‘procesando’, ‘completada’, ‘cancelada’), DEFAULT ‘pendiente’
●	total: DECIMAL(10,2), NOT NULL
●	tipo_orden: ENUM(‘producto’,‘material’,‘directo_constructoken’), DEFAULT ‘producto’
●	id_tienda: INT (FK → Tiendas_Materiales)
●	precio_final: DECIMAL(10,2)
●	estado_material: ENUM(‘pendiente’,‘aceptado’,‘enviado’,‘entregado’)
1.4 Detalle de Órdenes
Detalle línea a línea de cada orden.
●	id_detalle: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_orden: INT (FK → Órdenes)
●	id_producto: INT (FK → Productos)
●	cantidad: INT, NOT NULL
●	precio_unitario: DECIMAL(10,2), NOT NULL
●	subtotal: DECIMAL(10,2), NOT NULL
1.5 Reseñas y Calificaciones
Evaluación de productos y/o vendedores.
●	id_resena: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_producto: INT (FK → Productos)
●	id_usuario: INT (FK → Usuarios)
●	rating: INT (1 a 5)
●	comentario: TEXT
●	fecha_resena: DATETIME, DEFAULT CURRENT_TIMESTAMP
1.6 Direcciones
Direcciones para envíos y facturación.
●	id_direccion: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_usuario: INT (FK → Usuarios)
●	calle: VARCHAR(255), NOT NULL
●	ciudad: VARCHAR(100), NOT NULL
●	estado: VARCHAR(100), NOT NULL
●	codigo_postal: VARCHAR(20)
●	pais: VARCHAR(100)
●	latitud: DECIMAL(10,7)
●	longitud: DECIMAL(10,7)
1.7 Envíos
Información logística de las órdenes.
●	id_envio: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_orden: INT (FK → Órdenes)
●	fecha_envio: DATETIME
●	fecha_estimada_entrega: DATETIME
●	estado_envio: ENUM(‘en_transito’,‘entregado’), DEFAULT ‘en_transito’
●	empresa_envio: VARCHAR(100)
●	tipo_empresa_envio: ENUM(‘tienda’,‘constructoken’), DEFAULT ‘tienda’
●	numero_tracking: VARCHAR(100)
1.8 Carrito de Compras (Opcional)
Se modela en dos tablas para capturar el estado temporal de la compra.
●	Tabla Carrito:
●	id_carrito: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_usuario: INT (FK → Usuarios)
●	Tabla Detalle del Carrito:
●	id_item: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_carrito: INT (FK → Carrito)
●	id_producto: INT (FK → Productos)
●	cantidad: INT
●	precio_snapshot: DECIMAL(10,2)
●	fecha_precio: DATETIME
●	subtotal: DECIMAL(10,2), NOT NULL
1.9 Transacciones / Pagos (Marketplace)
Registro de los pagos asociados a las órdenes.
●	id_transaccion: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_orden: INT (FK → Órdenes)
●	fecha_pago: DATETIME, DEFAULT CURRENT_TIMESTAMP
●	monto: DECIMAL(10,2), NOT NULL
●	metodo_pago: VARCHAR(50)
●	estado_pago: ENUM(‘confirmado’,‘pendiente’,‘rechazado’), DEFAULT ‘pendiente’
	2.	MÓDULO PROYECTOS
2.1 Proyectos
Proyectos de construcción creados por el constructor.
●	id_proyecto: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_usuario: INT (FK → Usuarios, rol constructor)
●	id_zona: INT (FK → Zonas, nullable)
●	id_tipo_proyecto: INT (FK → Tipos_Proyecto, nullable)
●	nombre_proyecto: VARCHAR(150), NOT NULL
●	descripcion: TEXT
●	monto_total: DECIMAL(12,2), DEFAULT 0
●	fecha_creacion: DATETIME, DEFAULT CURRENT_TIMESTAMP
●	fecha_actualizacion: DATETIME, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
●	estado: ENUM(‘creado’,‘en_calculo’,‘cotizacion’,‘activo’,‘pagando’,‘finalizado’), DEFAULT ‘creado’
2.2 Tipos de proyectos
Para manejar ampliación, casa completa, personalizado, etc.
●	id_tipo_proyecto: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	nombre_tipo: VARCHAR(100) NOT NULL
●	descripcion: TEXT
2.3 Etapas
Cada proyecto se divide en fases.
●	id_etapa: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_proyecto: INT (FK → Proyectos)
●	nombre_etapa: VARCHAR(150), NOT NULL
●	descripcion: TEXT
●	monto_etapa: DECIMAL(12,2), DEFAULT 0
●	orden_etapa: INT, DEFAULT 1
●	estado: ENUM(‘pendiente’,‘completada’), DEFAULT ‘pendiente’
●	id_orden_wallet: INT (FK → Órdenes)
●	id_orden_material: INT (FK → Órdenes)
2.4 Items
Representa ítems constructivos a gran escala (ej.: “Columna”, “Zapata”, “Losa”).
	id_items: INT (PK, auto_increment)
	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_etapa: INT (FK → Etapas)
●	nombre_componente: VARCHAR(150), NOT NULL
●	descripcion: TEXT
●	cantidad: DECIMAL(10,2), NOT NULL
●	precio_item: DECIMAL(10,2), NOT NULL
●	monto_total: DECIMAL(12,2)
●	id_materiales_servicio: INT (FK → Materiales_Servicios, opcional)
2.5 Recursos
Desglosa los recursos necesarios para 1 unidad de un componente, distinguiendo entre materiales, mano de obra y equipo.
●	id_desglose: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_items: INT (FK → Items)
●	tipo_recurso: ENUM(‘material’,‘mano_obra’,‘equipo’), NOT NULL
●	descripcion: VARCHAR(255)
●	cantidad_requerida: DECIMAL(10,2), NOT NULL
●	precio_unitario: DECIMAL(10,2), NOT NULL
●	unidad_medida: VARCHAR(50)
●	precio_total_unit: DECIMAL(12,2)
2.6 Materiales_items
Permite que un mismo componente (“Muro exterior”) ofrezca varias alternativas de materiales.
●	id_opcion: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_items: INT (FK → Items)
●	id_materiales_servicio: INT (FK → Materiales_Servicios)
●	descripcion: VARCHAR(255)
●	seleccionada: BOOL DEFAULT FALSE
2.7 Documentos del proyecto
Permite almacenar la referencia a los documentos del proyecto (listas de materiales, planos, etc.).
●	id_archivo: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_proyecto: INT (FK → Proyectos)
●	tipo_documento: ENUM(‘lista_materiales’,‘planos’,‘reporte’,‘otro’), NOT NULL
●	nombre_archivo: VARCHAR(255)
●	url_archivo: VARCHAR(500)
●	fecha_generacion: DATETIME, DEFAULT CURRENT_TIMESTAMP
●	tamano_archivo: INT
●	extension: VARCHAR(10)
2.8 Zonas
●	id_zona: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	nombre_zona: VARCHAR(100), NOT NULL
●	coeficiente_region: DECIMAL(5,2), DEFAULT 1.00
2.9 Caracteristicas_Proyectos
Almacena información paramétrica de cada tipo de proyecto (ampliación, casa…).
●	id_caracteristicas_proyecto: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_tipo_proyecto: INT (FK → Tipos_Proyecto)
●	nombre_plantilla: VARCHAR(150)
●	clima: ENUM(‘templado’,‘frío’,‘cálido’,‘otro’)
●	dimension_terreno: VARCHAR(50)
●	superficie_construccion: DECIMAL(10,2)
●	num_paredes: TINYINT
●	planta: ENUM(‘baja’,‘alta’), DEFAULT ‘baja’
●	tipo_techo: VARCHAR(100)
●	material_pared: VARCHAR(100)
●	acabados_interior: TEXT
●	acabados_exterior: TEXT
	3.	MÓDULO WALLET
3.1 Wallet_Accounts
Cuenta del wallet para cada usuario.
●	id_wallet: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_usuario: INT (FK → Usuarios)
●	saldo_actual: DECIMAL(12,2), DEFAULT 0
●	interes_acumulado: DECIMAL(12,2), DEFAULT 0
●	tasa_interes: DECIMAL(5,2), DEFAULT 0
●	external_account_id: VARCHAR(100)
●	fecha_apertura: DATETIME, DEFAULT CURRENT_TIMESTAMP
●	estado: ENUM(‘activo’,‘inactivo’,‘suspendido’), DEFAULT ‘activo’
3.2 Wallet_Transactions
Historial de movimientos del wallet.
●	id_transaccion: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_wallet: INT (FK → Wallet_Accounts)
●	tipo_transaccion: ENUM(‘deposito’,‘cargo_recurrente’,‘pago_en_autorizado’,‘pago_etapa’,‘interes’), NOT NULL
●	monto: DECIMAL(12,2), NOT NULL
●	fecha_transaccion: DATETIME, DEFAULT CURRENT_TIMESTAMP
●	descripcion: TEXT
●	external_reference: VARCHAR(150)
●	estado: ENUM(‘pendiente’,‘completada’,‘rechazada’), DEFAULT ‘pendiente’
3.3 Wallet_Payment_Methods
Configuración de cargos recurrentes y métodos de pago.
●	id_metodo_pago: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_wallet: INT (FK → Wallet_Accounts)
●	metodo: ENUM(‘CLABE’,‘tarjeta_de_debito’,‘pago_autorizado’), NOT NULL
●	datos_pago: JSON
●	estado: ENUM(‘activo’,‘inactivo’), DEFAULT ‘activo’
●	fecha_configuracion: DATETIME, DEFAULT CURRENT_TIMESTAMP
●	external_payment_id: VARCHAR(100)
	4.	HISTORIAL DE PRECIOS DE MATERIALES Y SERVICIOS
4.1 Materiales_Servicios (Catálogo)
Lista de materiales y servicios disponibles en el sistema.
●	id_materiales_servicio: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_categoria: INT (FK → Categorías)
●	tipo: ENUM(‘material’,‘servicio’), NOT NULL
●	nombre: VARCHAR(150), NOT NULL
●	descripcion: TEXT
●	unidad_medida: VARCHAR(50)
●	precio_actual: DECIMAL(10,2), NOT NULL
4.2 Categorías
Organización de productos en grupos o subcategorías.
●	id_categoria: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	nombre: VARCHAR(100), NOT NULL
●	id_categoria_padre: INT (FK → Categorías, nullable)
4.3 Historial_Costos_Materiales
Registro de las variaciones en el costo de cada ítem.
●	id_historial: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_materiales_servicios: INT (FK → Materiales_Servicios)
●	costo_unitario: DECIMAL(10,2), NOT NULL
●	fecha_registro: DATETIME, DEFAULT CURRENT_TIMESTAMP
	5.	VISTAS PAGOS POR PERIODOS (MENSUAL, SEMANAL, QUINCENAL)
Se puede manejar mediante vistas o reportes. Ejemplo de campos conceptuales:
●	id_wallet: INT
●	periodo: (formato YYYY-MM)
●	total_depositos: DECIMAL(12,2)
●	total_cargos_recurrentes: DECIMAL(12,2)
●	total_pago_etapa: DECIMAL(12,2)
●	total_pago_autorizado: DECIMAL(12,2)
●	total_intereses: DECIMAL(12,2)
	6.	MÓDULO CRÉDITOS
6.1 Créditos
Créditos otorgados a los usuarios (constructores) con devolución de un porcentaje de intereses.
●	id_credito: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_usuario: INT (FK → Usuarios)
●	monto_credito: DECIMAL(12,2), NOT NULL
●	tasa_interes: DECIMAL(5,2), NOT NULL
●	plazo: INT (en meses)
●	porcentaje_devolucion_intereses: DECIMAL(5,2), NOT NULL
●	cuotas_totales: INT, NOT NULL
●	cuotas_pagadas: INT, DEFAULT 0
●	monto_cuota: DECIMAL(10,2), NOT NULL
●	total_intereses: DECIMAL(12,2), NOT NULL
●	estado: ENUM(‘aprobado’,‘pendiente’,‘cancelado’,‘completado’), DEFAULT ‘pendiente’
●	fecha_aprobacion: DATETIME
●	fecha_inicio: DATETIME
●	fecha_fin: DATETIME
6.2 Credito_Pagos
Registro de los pagos realizados para cada crédito.
●	id_pago_credito: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_credito: INT (FK → Creditos)
●	monto_pagado: DECIMAL(10,2), NOT NULL
●	fecha_pago: DATETIME, DEFAULT CURRENT_TIMESTAMP
●	estado: ENUM(‘pendiente’,‘pagado’,‘fallido’), DEFAULT ‘pendiente’
●	external_reference: VARCHAR(150)
6.3 Vista de historial de pagos de créditos
Igualmente, suele implementarse como reporte/vista.
	7.	NUEVO MÓDULO: TIENDA DE MATERIALES
7.1 Tiendas_Materiales
Representa a las tiendas que reciben, aceptan y envían pedidos de materiales.
●	id_tienda: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_usuario: INT (FK → Usuarios, rol ‘tienda_material’)
●	nombre_tienda: VARCHAR(150), NOT NULL
●	direccion: VARCHAR(255)
●	latitud: DECIMAL(10,7)
●	longitud: DECIMAL(10,7)
●	contacto: VARCHAR(100)
7.2 Tienda_productos
Indica qué materiales/servicios vende cada tienda.
●	id_tienda_productos: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_tienda: INT (FK → Tiendas_Materiales)
●	id_materiales_servicios: INT (FK → Materiales_Servicios)
●	stock: INT
	8.	NUEVO MÓDULO: INVENTARIO_CONSTRUCTOKEN
Esta tabla administra el inventario de materiales que Constructoken vende directamente a las tiendas (venta directa).
●	id_inventario: INT (PK, auto_increment)
●	id_publico: CHAR(36), NOT NULL, UNIQUE
●	id_item: INT (FK → Materiales_Servicios)
●	stock: INT, NOT NULL
●	precio_unitario: DECIMAL(10,2), NOT NULL
●	fecha_actualizacion: DATETIME, DEFAULT CURRENT_TIMESTAMP
Notas finales
	Los campos id_publico: CHAR(36) se utilizan para exponer IDs únicos (UUID) al exterior.
	El diseño soporta ampliaciones, casas completas, proyectos personalizados y predeterminados gracias a la tabla tipos_proyecto y la parametrización en caracteristicas_proyectos.
	Se integra con el Marketplace mediante la vinculación id_materiales_servicios ↔ productos.
	La lógica de costos y etapas se maneja con tablas proyectos, etapas, items, recursos y materiales_items.
	Con ello se logra un modelo escalable para cubrir la funcionalidad de Constructoken.



Lógica carrito 

Voy a explicarte detalladamente cómo se maneja la información en el carrito y cómo se relaciona con la orden, junto con consideraciones sobre el precio de los productos:

---

### 1. Precio de los Productos en el Carrito

**Concepto:**
- **Snapshot del Precio:**  
  Cuando un usuario agrega un producto al carrito, en muchos sistemas se guarda una "instantánea" del precio actual del producto. Esto asegura que, aunque el precio del producto en el catálogo pueda cambiar posteriormente, el usuario se cobrará el precio que estaba vigente en el momento en que se agregó al carrito o al momento de confirmar la compra.
  
**Implementación:**
- **Opcionalmente, en el carrito se podría almacenar el precio:**  
  En el diseño actual, en la tabla **Detalle del Carrito** no hemos incluido explícitamente un campo para el precio unitario. Esto puede significar que:
  - La aplicación consulta el precio actual del producto al momento de mostrar el carrito y/o al proceder al pago.
  - O bien, la lógica del backend puede capturar ese precio en el momento del checkout y luego, al crear la orden, se almacena en **Detalle de Órdenes** (donde sí existe el campo **precio_unitario**).
  
**Ventajas de Capturar el Precio:**
- **Consistencia en el Pago:** Se asegura que el usuario pague un monto fijo, sin sorpresas si el precio del producto cambia.
- **Auditoría:** Permite saber qué precio tenía cada producto cuando se realizó la compra.

**Decisión de Negocio:**
- Puedes optar por almacenar el precio en el carrito (para luego copiarlo a la orden) o simplemente mostrar el precio actualizado en la interfaz y capturarlo al momento del checkout. La decisión depende de tus reglas de negocio y de cómo quieras manejar posibles variaciones de precio.

---

### 2. Relación entre Carrito y Orden

**Concepto General:**
- **Carrito como Contenedor Temporal:**  
  El carrito de compras actúa como un contenedor temporal donde el usuario acumula productos. No es la orden definitiva; es simplemente una lista de intenciones de compra.

**Flujo de Conversión:**
1. **Acumulación:**  
   - El usuario agrega productos al carrito. Cada producto se registra en la tabla **Detalle del Carrito** y se asocia a un registro en la tabla **Carrito** mediante la clave foránea **id_carrito**.
  
2. **Revisión y Confirmación:**  
   - El usuario revisa su carrito, realiza modificaciones (por ejemplo, cambia cantidades, elimina productos) y, cuando está listo, confirma la compra.
  
3. **Creación de la Orden:**  
   - En el momento del checkout, la aplicación (backend) toma la información del carrito y la transforma en una orden definitiva.  
   - Se crea un nuevo registro en la tabla **Órdenes** (con su encabezado: id_cliente, fecha, total, etc.).  
   - Por cada producto en el carrito, se crea un registro en la tabla **Detalle de Órdenes**, copiando la cantidad y, en ese momento, se registra el **precio_unitario** (que puede ser el snapshot capturado previamente o el precio actual del producto).
  
4. **Proceso de Pago:**  
   - Una vez creada la orden, se procede a procesar el pago (ya sea a través de la Wallet o de otra pasarela).
  
5. **Limpieza del Carrito:**  
   - Con la orden confirmada, el carrito se vacía o se marca como "procesado" para mantener un historial, según decidas en la lógica de negocio.

**Relación en la Base de Datos:**
- **No existe una FK directa de la orden al carrito:**  
  La relación entre carrito y orden se maneja a nivel de la lógica de negocio. Es decir, el carrito es un estado previo a la creación de la orden.  
- **Tablas Separadas:**
  - La tabla **Carrito** (con su encabezado) y la tabla **Detalle del Carrito** sirven para almacenar temporalmente la selección del usuario.
  - Una vez que se confirma la compra, se crea un registro en **Órdenes** y en **Detalle de Órdenes** a partir de la información del carrito.
  
**Conclusión:**
- La lógica de conversión del carrito a la orden se implementa en el backend (y se coordina con el front-end) y no requiere una relación directa en la base de datos entre la orden y el carrito.  
- Es común que, una vez realizada la conversión, el sistema borre o archive la información del carrito.

---

### Resumen

1. **Precio en el Carrito:**  
   Se puede almacenar un snapshot del precio cuando se agrega el producto o capturarlo al momento del checkout para asegurarse de cobrar el precio correcto.

2. **Relación Carrito – Orden:**  
   - **Carrito:** Tabla temporal que contiene los productos seleccionados por el usuario.  
   - **Orden:** Se crea una orden definitiva a partir del contenido del carrito en el momento del checkout.  
   - La conversión es manejada por la lógica de negocio y no se modela como una relación directa (FK) entre la tabla Carrito y la tabla Órdenes.

Esta estructura es común en sistemas de comercio electrónico y cumple con las mejores prácticas, permitiendo flexibilidad y consistencia en el proceso de compra.



Snapshot en el carrito

 La idea es la siguiente:
1.	Captura del Precio en el Carrito:
Cuando el usuario agrega un producto al carrito, se guarda un snapshot (una copia del precio actual) junto con una marca de tiempo.
2.	Actualización Condicional:
En el backend se implementa una lógica que revisa el snapshot cada 24 horas o si ocurre un cambio abrupto (por ejemplo, un incremento significativo) en el precio. Si se detecta que la reserva de precio ha expirado o que el precio ha variado considerablemente, el snapshot se actualiza al precio actual.
3.	Generación de la Orden:
Cuando el usuario procede al checkout, el sistema utiliza el precio snapshot almacenado en el carrito (ya validado y actualizado según corresponda) para generar el detalle de la orden. Cada línea de la orden se crea usando ese precio, la cantidad seleccionada y se calcula el subtotal.
Esta estrategia permite mantener un control del precio durante un período determinado, pero también protege a la empresa en caso de fluctuaciones bruscas, asegurando que la orden refleje un precio que esté lo más cerca posible del valor actual sin congelarlo indefinidamente.


Logica ubicación y precio de materiales

A continuación se explica cómo se “registran” los precios por zona y quién los determina, tanto para el Marketplace como para el módulo de Proyectos. También se describe cómo se van almacenando esos datos en la base de datos, usando la tabla Historial_Costos_Materiales (con un campo id_zona) y cómo se refleja luego en los productos.
 
1. Registro de Precios por Zona: Quién lo Decide y Dónde se Almacena
1.1 Admin de Constructoken (o Personal Autorizado)
Por lo general, el encargado de ingresar o actualizar precios por región es un administrador (o un grupo de usuarios con rol “admin” en tu sistema). Este admin tiene acceso a una interface interna (un panel o dashboard) donde puede:
1.	Seleccionar un material o servicio en la tabla Materiales_Servicios (por ejemplo, “Block Macizo”).
2.	Elegir la zona (ej. “Zona Norte”) o dejarla como “zona global/null”.
3.	Indicar el nuevo costo_unitario y la fecha de vigencia.
4.	Guardar un registro nuevo en Historial_Costos_Materiales con (id_materiales_servicios, id_zona, costo_unitario, fecha_registro=NOW()).
De este modo, cada vez que exista un cambio de precio en la región, se inserta (o actualiza, dependiendo de la política) un nuevo registro en Historial_Costos_Materiales.
1.2 Tabla Historial_Costos_Materiales con id_zona
Recuerda que la estructura quedaría así (con el campo clave para zona):
Historial_Costos_Materiales
---------------------------
id_historial               INT (PK, auto_increment)
id_publico                 CHAR(36) NOT NULL UNIQUE
id_materiales_servicios    INT (FK → Materiales_Servicios)
id_zona                    INT (FK → Zonas, nullable)
costo_unitario             DECIMAL(10,2) NOT NULL
fecha_registro             DATETIME DEFAULT CURRENT_TIMESTAMP

Inserción típica para un nuevo precio:
INSERT INTO Historial_Costos_Materiales
(id_materiales_servicios, id_zona, costo_unitario, fecha_registro)
VALUES
(10, 2, 48.50, NOW());

●	id_materiales_servicios = 10 → “Block Macizo”
●	id_zona = 2 → “Zona Norte”
●	costo_unitario = 48.50
●	fecha_registro → Fecha actual
Resultado: Se deja registro de que, a partir de hoy, “Block Macizo” cuesta 48.50 en la “Zona Norte”.
1.3 Repetir para Diferentes Zonas
Para cada material/servicio que esté disponible en diferentes zonas con distintos precios, el admin crea uno o varios registros (uno por cada (material, zona, costo)).
●	Si en la “Zona Centro” cuesta 45.0, se hace otro registro con id_zona=3, costo_unitario=45.0.
●	Si en la “Zona Sur” no hay precio distinto, se puede usar un id_zona=NULL como precio base o no registrarlo.
Así se modela que “Block Macizo” está disponible en tales zonas con X precio.
 
2. Disponibilidad de un Producto en el Marketplace Según la Zona
Cuando el usuario (constructor) o cualquier usuario del marketplace ve el producto “Block Macizo”, el sistema:
1.	Toma su dirección (o la “zona” inferida).
2.	Verifica el Productos.id_materiales_servicios.
3.	Consulta en Historial_Costos_Materiales la última entrada para (id_materiales_servicios, id_zona_del_usuario).
4.	Muestra ese precio.
5.	Si no existe, recurre a un precio global (id_zona=NULL) o al coeficiente_region.
Quién determina la “disponibilidad” real:
●	Si la zona no está dada de alta en Historial_Costos_Materiales, se podría mostrar un mensaje “No disponible en tu región” o usar el costo base.
●	Si el stock del Producto no es 0, el usuario puede comprarlo.
Así se controla dónde y a qué precio se vende.
 
3. Relación con Items/Etapas/Proyectos
1.	Proyecto de un usuario en “Zona Norte” (id_zona=2).
2.	Ítem (ej. “Muro con Block Macizo”) se vincula a id_materiales_servicio=10.
3.	Al calcular costo, se revisa Historial_Costos_Materiales (10, 2) → se obtiene 48.50 (en el ejemplo).
4.	Se multiplica por la cantidad necesaria.
5.	Se actualiza el “precio_item” en la tabla “Items” o su desglose en la tabla “Recursos” según sea tu lógica.
 
4. Conclusiones
1.	El admin (o personal autorizado) ingresa y actualiza precios por zona para cada material/servicio, guardando esos datos en Historial_Costos_Materiales.
2.	Al consultar el Marketplace o Proyectos en la zona del usuario, se obtiene la última entrada para (material, zona) y se muestra o calcula con ese precio.
3.	Para un producto “Block Macizo” (id_producto=50), vinculado a “Block Macizo” (id_materiales_servicios=10), si el usuario está en “Zona Norte” (id_zona=2), se obtienen 48.50 como “precio” o “costo unitario”.
4.	La disponibilidad en cada zona se “implícitamente” controla al tener o no un costo en ese (material, zona). Si no existe, podría interpretarse como “no disponible” o usar un precio global (id_zona=NULL).
 
En Resumen:
●	Cómo se registran los precios por zona:

○	El admin ingresa (por tu panel interno) un nuevo registro en Historial_Costos_Materiales con (id_materiales_servicios, id_zona, costo_unitario).
○	Así, “Producto A / Material A” queda con un precio distinto en cada región.
●	Cómo se decide:

○	Generalmente, Constructoken (el admin) o la tienda definen esos precios.
○	En la base de datos, se inserta un registro por cada variante de (material, zona) y su costo_unitario.
●	Cómo se reflejan en la tabla:

○	La tabla Historial_Costos_Materiales guarda varios registros con id_zona distinto para el mismo id_materiales_servicios.
○	Al mostrar o calcular, se toma el más reciente para la zona del usuario.




