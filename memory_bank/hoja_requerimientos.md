Documento de Requerimientos de Software para Constructoken


1. Descripción

Constructoken es una plataforma tecnológica diseñada para facilitar la construcción de vivienda de manera autogestiva. A través de un ecosistema de servicios financieros y no financieros, ofrece a los autoproductores de vivienda y migrantes mexicanos las herramientas necesarias para construir su hogar en México.
En esencia, Constructoken funciona como un marketplace integrado con servicios financieros, donde se pueden adquirir materiales y contratar diversos servicios. Además, la plataforma permite calcular proyectos con un enfoque de vivienda progresiva, facilitando la construcción por etapas. Cada una de estas etapas puede pagarse en un solo desembolso o de manera gradual, a través de distintos productos financieros.
Además de hacer el proceso de construcción más eficiente, el principal objetivo de Constructoken es que la vivienda sea accesible a través de diseños, procesos constructivos, materiales y servicios que hagan economica la construcción de viviendas, así mismo, proporcionando servicios financieros que lo pueda hacer realidad. 

2. Usuarios 

Constructor: Es el usuario principal. Son personas interesadas en construir, ampliar o remodelar su vivienda. Puede que sea una persona que viva en México o un migrante que envía dinero para construir su vivienda desde el extranjero. 
-El reto para los que se encuentran en México es poder construir basado en sus necesidades y capacidad de pago. También, muchos de ellos no tienen acceso al financiamiento formal porque trabajan en la informalidad, no tienen a su nombre la propiedad, tienen mal historial crediticio o simplemente el crédito es demasiado caro. 
-El reto es construir con transparencia desde el extranjero. Así mismo, brindar soluciones ya que la mayoría no tiene historial crediticio en México lo que limita su acceso al crédito para la vivienda.

Tienda de Materiales:
Son proveedores especializados que se encargan de recibir, aceptar y enviar pedidos de materiales. Estas tiendas tienen un portal propio que, en el futuro, se podrá ampliar a un modelo SaaS (venta en sitio, manejo de inventario, control de costos, etc.).
También tienen la posibilidad de comprar materiales directamente a Constructoken, para luego distribuirlos a los constructores.

Administrador:
Es el personal autorizado de constructoken que gestiona la plataforma a través de un panel de administrador.

3. Integraciones importantes

-FINSUS (SOFIPO regulada por la CNBV):
Es una cuenta de una institución financiera regulada por la CNBV con rendimientos del 10% anual, garantizando la protección de depósitos hasta 25,000 UDIS.  Esta cuenta en Constructoken permite a los usuarios tener una cuenta virtual (wallet) asociada a una cuenta bancaria real gestionada por una entidad financiera.

Finsus también ofrece formas de pagar a esta cuenta como la domiciliación de tarjeta o cuenta CLABE, también a través de comercios autorizados. Esto sólo aplica para construpagos o construcreditos.

-Pasarela de pagos

Son integraciones para el pago con tarjeta de débito, crédito, paypal o efectivo en comercios autorizados. Este solo se utiliza en caso de que el pago se haga en una sola exhibición en el marketplace. 


4. Requerimientos


4.1 App constructores 




a)	Inicio de sesión 


    Inicio de Sesión
Descripción:
Espacio en la aplicación donde el usuario (Constructor) puede crear su cuenta y acceder a Constructoken para utilizar los demás módulos (Marketplace, Proyectos, Wallet, etc.). Permite registrarse con datos personales o con una cuenta de Google, iniciar sesión con credenciales seguras y recuperar contraseña cuando sea necesario.

Logica:
	1.	Inicio de Sesión (Login)
	•	El usuario ingresa su correo (o teléfono) y contraseña en la pantalla de acceso.
	•	El sistema verifica credenciales con el backend (FastAPI).
	•	Si las credenciales son válidas, se devuelve un token (JWT/OAuth2), permitiendo acceder al resto de funcionalidades de la App.
	•	Si son inválidas, se muestra un mensaje de error.
	2.	Registro Manual
	•	El usuario selecciona la opción “Crear cuenta” e ingresa nombre, correo, teléfono (opcional) y contraseña.
	•	(Opcional) Si se requiere verificación, la aplicación envía un código de confirmación al correo o SMS para validar la cuenta.
	•	Al completarse el registro, la cuenta queda habilitada para iniciar sesión.
	3.	Registro con Google
	•	El usuario puede elegir la opción de “Iniciar sesión con Google”.
	•	La App redirige a la autenticación de Google, y tras confirmarla, se crea o asocia el usuario en Constructoken (según sea nuevo o existente).
	•	Este flujo evita que el usuario deba crear o recordar otra contraseña.
	4.	Recuperación de Contraseña
	•	El usuario indica su correo y la App envía un enlace o código de verificación para resetear la contraseña.
	•	Tras confirmar el código o enlace, el usuario ingresa su nueva contraseña.
	•	Se actualiza la contraseña en la base de datos y el usuario puede volver a iniciar sesión.
	5.	Manejo de Sesión
	•	El sistema asigna un token con tiempo de expiración (p.ej., 24 horas).
	•	Al reabrir la App, si el token sigue vigente, el usuario permanece autenticado.
	•	Si el token expira o se cierra sesión voluntariamente, se pide de nuevo usuario/contraseña (o Google).

Requerimientos funcionales:
	1.	Inicio de Sesión
	•	Validación de credenciales (correo/contraseña).
	•	Generación y almacenamiento seguro del token de sesión.
	•	Mensajes de error en caso de credenciales inválidas.
	2.	Registro (Manual y Google)
	•	Captura de datos básicos (nombre, correo, teléfono, contraseña) en el registro manual.
	•	Integración con Google para registro/inicio de sesión mediante cuenta de Gmail (OAuth).
	•	Envío opcional de código de verificación por correo/SMS para activar la cuenta.
	3.	Recuperación de Contraseña
	•	Solicitud de correo.
	•	Envío de enlace o código temporal para permitir la creación de una nueva contraseña.
	•	Validación de códigos de recuperación, para evitar usos indebidos.
	4.	Sesiones y Seguridad
	•	Tokens con expiración (JWT/OAuth2) para restringir el acceso a usuarios no autenticados.
	•	Cierre de sesión voluntario desde la App (invalidar token local).
	•	Mecanismo de expiración o refresh si se requiere experiencia más prolongada.
	5.	Integración con Backend
	•	Los endpoints de login, registro y recuperación se comunican con el backend (FastAPI) para la validación y persistencia de datos (SQLAlchemy).
	•	Debe manejarse cifrado de contraseñas y uso de HTTPS para proteger la información en tránsito.



b)	Marketplace


Descripción:  Tienda digital donde los usuarios pueden comprar materiales de construcción y contratar servicios de construcción, conectándose con proveedores confiables dentro de la plataforma.


Logica:

1.	Selección de Ubicación del Proyecto
●	Al ingresar al Marketplace, el usuario debe seleccionar la ubicación de su proyecto de construcción.
●	Esta información permitirá que el sistema filtre las tiendas de materiales y proveedores de servicios que operan en esa zona.
2.	Filtrado de Tiendas y Proveedores
●	Con base en la ubicación del usuario, el sistema mostrará sólo los productos de las tiendas y proveedores de servicios que pueden realizar envíos o prestar servicios en esa zona.
●	Cada tienda tiene definidas sus zonas de cobertura y costos de envío, que se calculan en función de la distancia al proyecto.
3.	Selección de Productos y Servicios
●	Los usuarios pueden explorar los productos y servicios disponibles en las tiendas cercanas.
●	Se pueden ver un menu con las categorias principales (ej, acabados, acero, block, etc.).En el futuro se podrán aplicar filtros avanzados (categoría, precio, disponibilidad, proveedor, tiempo de entrega). 
4.	Cálculo del Costo de Envío
●	Antes de finalizar la compra, el sistema calcula el costo de envío en función de:
○	Distancia entre la tienda y el proyecto.
○	Tarifas de envío de cada tienda (pueden variar según peso, volumen o categoría de producto).
●	Se mostrarán opciones de tiendas con costos de envío diferenciados para que el usuario elija la más conveniente.
5.	Métodos de Pago
●	Los usuarios podrán pagar sus pedidos a través de:
✅ Tarjeta de débito/crédito (procesado por una pasarela de pagos segura).
✅ SPEI (transferencia interbancaria).
✅ Wallet (uso de saldo disponible en la plataforma).
✅ Créditos (solo si ya tiene un crédito autorizado o si inicia el proceso de solicitud).
6.	Gestión y Seguimiento de Pedidos
●	Una vez confirmado el pedido, la tienda recibe la orden y confirma el tiempo de entrega.
●	El usuario puede dar seguimiento al pedido en tiempo real.
●	Se generan notificaciones automáticas cuando hay cambios en el estado del pedido.



Requerimientos funcionales

-Selección de ubicación antes de mostrar tiendas y productos.
-Filtrado de tiendas y proveedores según ubicación.
-Cálculo dinámico del costo de envío.
-Configuración de entrega (fecha y lugar).
-Métodos de pago: Tarjeta, SPEI, Wallet y Créditos.
-Gestión y seguimiento de pedidos.
-Historial de compras y comprobantes.

c)	Proyectos


Descripción: Espacio donde los usuarios pueden diseñar, planificar y gestionar la construcción de su vivienda en etapas. Aquí pueden visualizar costos, materiales y el avance de su obra, asegurando una planificación eficiente.


Logica:

1.	Selección de la ubicación del proyecto. Es la ubicación elegida en el marketplace o se puede cambiar para disho proyecto,, y es necesaria para saber los precios que tiene en la zona que le corresponde. 
2.	Selección del Tipo de Proyecto
○	Los usuarios pueden elegir entre:
✅ Construcción (desde cero).
✅ Ampliación (agregar una sección como recámara, estancia, baño, cocina, local, etc.).
✅ Remodelación (modificaciones a una construcción existente).
✅Proyecto personalizado
✅Proyecto predeterminado
○	Dependiendo de la selección, se muestran opciones de personalización.
3.	Personalización del Proyecto
○	Para cada tipo de construcción, el usuario selecciona características como:
■	Tamaño (m²).
■	Materiales (bloques, tabiques, concreto, etc.).
■	Ubicación (para saber si es primer piso o segundo piso, si requiere 2,3 o 4 paredes, etc.)
■	Acabados (básico, intermedio, premium).
○	A medida que el usuario selecciona opciones, se actualiza el costo del proyecto en tiempo real, mostrando:
■	Costo de mano de obra.
■	Costo de materiales.
■	Costo total estimado.
4.	División en Etapas Constructivas
○	Los proyectos se dividen en etapas para permitir una construcción progresiva.
○	Cada etapa se compone de una serie de ítems que deben construirse.
○	Los ítems tienen costos de:
■	Mano de obra.
■	Materiales.
■	Herramientas necesarias.
5.	Cálculo de Costos
○	Se desglosan los precios de cada ítem con base en:
■	Precios de mano de obra, materiales y herramientas disponibles en el catálogo de Constructoken (según ubicación).
■	Si no hay un precio disponible en el catálogo, se aplica un coeficiente de estimación basado en costos actuales de la zona.
○	El costo total del proyecto se muestra por etapas y en su totalidad.
6.	Generación de Documentos PDF
○	Una vez que el usuario define su proyecto, se genera un documento en PDF que se puede descargar en el resumen del proyecto con:
■	Resumen del proyecto.
■	Costos por etapa y totales.
■	Lista detallada de materiales, mano de obra y herramientas.
■	Cronograma estimado.
7.	Opciones de Pago por Etapa
○	Cada etapa se puede pagar de dos maneras:
✅ Pago en una sola exhibición (tarjeta de débito/crédito, SPEI).
✅ Pago a ritmo del usuario mediante:
■	Wallet (saldo disponible o ahorros progresivos).
■	Crédito (si el usuario tiene uno aprobado o inicia la solicitud).
8.	Conversión en Pedido
○	Cuando el usuario decide pagar una etapa, los materiales y servicios pasan automáticamente al carrito para procesar la transacción en el Marketplace.
○	El usuario confirma el pago y se generan las órdenes para los proveedores y constructores.
9.	Historial. Es importante tener el historial de precios de forma interna para aplicar un modelo de machine learning para predecir el aumento de los precios.

Anexo 1- Calculo de proyectos


A continuación se presenta una descripción más detallada del Módulo de Proyectos, que contempla la gestión, cálculo y parametrización de diferentes tipos de construcciones (ampliaciones, casas completas, proyectos personalizados y proyectos predeterminados). Además, se incluye la lógica de vinculación con el marketplace para obtener los precios de materiales y reflejarlos en la calculadora de costos.
1. Tipos de Proyectos
	1.	Ampliación:
	•	El usuario selecciona un tipo de ampliación (ej. cuarto adicional, habitación en segundo piso, etc.).
	•	Se especifica la configuración del cuarto en cuanto a dimensiones, ubicación (planta baja o alta) y número de paredes requeridas (4, 3 o 2, según la construcción existente).
	•	Cada ampliación contempla etapas como cimientos, paredes, techos, acabados (interiores, exteriores, pisos) y cancelería (puertas, ventanas).
	•	El cálculo de costos se vincula al precio de los materiales disponibles en el marketplace.
	•	El administrador puede dar de alta distintos tipos de ampliación y su lógica de cálculo (reglas y fórmulas asociadas), ligándolos con los productos y precios del marketplace.
	2.	Casa Completa:
	•	Sigue la misma estructura de etapas (cimientos, estructura, acabados, etc.), pero a mayor escala.
	•	Las opciones de acabados y configuraciones son más amplias y complejas que en una ampliación.
	•	Se parametriza de forma similar a la ampliación, pero con mayor detalle en cada sección (por ejemplo, más tipos de techos, mayor variedad de recubrimientos, etc.).
	3.	Proyecto Personalizado:
	•	El administrador carga el proyecto completo (planos, características y fichas técnicas).
	•	Cada proyecto se vincula con los materiales necesarios para su construcción, estableciendo la relación con los productos en el marketplace.
	•	El usuario visualiza un “costo estimado” con base en esas especificaciones y puede ajustar ciertos parámetros, si así se define en la configuración del proyecto.
	4.	Proyecto Predeterminado:
	•	Similar al personalizado, pero visible de manera directa para el usuario (por ejemplo, un modelo de casa tipo A, B o C, ya definido).
	•	El usuario puede elegir este proyecto y ver de inmediato los costos aproximados, con la posibilidad de modificar algunos detalles (acabados, colores, etc.) si así se contempla en el proyecto.
2. Cálculo de Costos
2.1. Flujo General en el Frontend
	1.	El usuario selecciona el tipo de proyecto (ampliación, casa, personalizado o predeterminado).
	2.	El sistema pregunta por características específicas (dimensiones, número de muros, tipo de acabado, tipo de techo, etc.).
	3.	En segundo plano, el backend calcula los costos de cada etapa (cimientos, estructura, acabados, cancelería, etc.) con base en las reglas de construcción.
	4.	El resultado se actualiza en tiempo real (o según convenga) en una calculadora visible para el usuario.
2.2. Variables de Cálculo por Etapa
	•	Cimientos:
	•	Se determinan con base en la superficie (m²), el tipo de terreno o la configuración (planta alta/planta baja), y se calcula la cantidad de material de cimentación requerido.
	•	Estructura (Paredes y Techos):
	•	Cantidad de muros según el número de paredes (4, 3 o 2).
	•	Tipo de material elegido (block, tabique, panel prefabricado, etc.).
	•	Tipo de techo (losa, lámina, entrepiso de madera, etc.).
	•	Acabados (Interiores y Exteriores):
	•	Tipo de recubrimiento (pintura, yeso, panel, aplanado, azulejo, etc.).
	•	Tipo de piso (cerámica, madera, vinilo, etc.).
	•	Costos de mano de obra y material.
	•	Cancelería:
	•	Puertas y ventanas seleccionadas (material, dimensiones y cantidad).
	•	Adicionalmente, puede haber extras (barandales, rejas, etc.) en futuros desarrollos.
2.3. Vinculación con el Marketplace
	•	Cada elemento (cemento, block, pintura, ventanas, etc.) está asociado a un producto en el marketplace, con su respectivo precio unitario.
	•	El administrador define la lógica de consumo de materiales (por m², por largo x ancho, por número de elementos, etc.).
	•	El sistema consulta esos precios para calcular el costo final, sumando mano de obra y posibles márgenes de utilidad o costos indirectos.
3. Parametrización y Administración
	1.	Tipos de Ampliaciones y Casas:
	•	El administrador puede crear o editar diferentes categorías y subcategorías (ej.: “Ampliación en segundo piso con 3 muros”).
	•	Se definen reglas de cálculo específicas (fórmulas, factores de consumo de materiales, etc.).
	2.	Proyectos Personalizados y Predeterminados:
	•	El administrador puede subir planos, imágenes y descripciones del proyecto.
	•	Cada proyecto tiene asociadas sus etapas de construcción y los materiales requeridos.
	•	El administrador controla qué partes puede modificar el usuario y qué partes están fijas.
	3.	Gestión de Precios y Materiales:
	•	Desde el panel de administración se actualizan los precios del marketplace y las equivalencias (ej. “1 m² de muro = 12 blocks”).
	•	Cuando el usuario realiza cambios de especificaciones, el sistema recalcula sobre la base de datos actualizada.
	4.	Habilitación / Deshabilitación por Zona o MVP:
	•	Se podrá mostrar u ocultar tipos de proyectos por región geográfica o zona.
	•	Para el MVP, se pueden ir habilitando paulatinamente los distintos tipos de proyectos o categorías según las prioridades de implementación.
4. Consideraciones Futuras
	•	Visualización Avanzada: En un futuro, se desea que el usuario pueda visualizar en 3D o ver renders de su proyecto mientras selecciona características.
	•	Más Opciones de Cancelaría y Extras: Se planea incluir mayor variedad de elementos (domos, tragaluces, techumbres especiales, etc.) con costos asociados.
	•	Mejoras en Cálculo de Mano de Obra: Podrá haber un sistema más detallado para estimar la mano de obra según la ubicación o complejidad del proyecto.
	•	Financiamiento y Pagos en Etapas: Vincular los proyectos y sus costos a planes de pago o financiamiento directamente desde la plataforma.
5. Resumen
El Módulo de Proyectos debe permitir a los usuarios:
	1.	Elegir un tipo de proyecto (Ampliación, Casa, Personalizado o Predeterminado).
	2.	Seleccionar y configurar sus características (dimensiones, materiales, acabados, etc.) de forma modular.
	3.	Ver en tiempo real (o con recálculos en cada paso) los costos asociados gracias a la integración con el marketplace de materiales.
	4.	Recibir una estimación final que refleje el costo total, incluyendo cimientos, estructura, acabados y cancelería.
Mientras tanto, el administrador podrá:
	•	Dar de alta diferentes proyectos, con sus reglas de cálculo y sus precios de materiales.
	•	Definir etapas, consumos y fórmulas para cada tipo de construcción.
	•	Activar o desactivar proyectos o categorías según zona geográfica o estado de desarrollo del MVP.
Este planteamiento garantiza la escalabilidad y la flexibilidad de la plataforma, permitiendo que cada nuevo tipo de proyecto o variante de cálculo se integre de manera ordenada, con la posibilidad de habilitar futuras funcionalidades y mejorar continuamente la experiencia del usuario.

Requerimientos funcionales:


- Selección de tipo de proyecto (Construcción, Ampliación, Remodelación).
- Cálculo automático de costos en tiempo real.
- División en etapas constructivas.
- Generación de PDF con detalles del proyecto.
- Métodos de pago (pasarela- tarjeta de débito crédito /spei, construpagos, credito)
- Seguimiento del progreso por etapa.
- Integración con el Marketplace.


d)	Wallet

Descripción: Billetera digital que permite a los usuarios administrar su dinero dentro de la plataforma, ya sea mediante ahorro progresivo (Construpagos) o pago de créditos. Desde aquí pueden pagar materiales, servicios y gestionar sus fondos de construcción.  Esta billetera está asociada a una cuenta bancaria real gestionada por una entidad financiera. Así mismo, cuando hay una meta de construcción en proyectos, osea una etapa de construcción, se muestra una línea de progreso de la meta.


Logica:

1.	Apertura de Cuenta Finsus
●	Los usuarios deben abrir su cuenta Finsus dentro de la misma aplicación de Constructoken.
●	Una vez abierta, el usuario podrá acceder a un apartado en Constructoken que muestra su saldo y transacciones.
●	En Finsus, los usuarios pueden gestionar sus fondos, realizar retiros y ver su historial completo.
2.	Visualización de la Cuenta en Constructoken
●	En Constructoken, los usuarios pueden ver:
○	Saldo total en su cuenta Finsus.
○	Historial de transacciones (depósitos, intereses ganados, compras en Constructoken, retiros).
○	Línea de progreso si tienen una meta activa de construcción (separando el ahorro y los intereses acumulados).
3.	Opciones de Depósito
●	Se pueden realizar depósitos mediante:
✅ Domiciliación (pagos recurrentes desde una cuenta de débito o CLABE).
✅ Tarjeta de débito o crédito (depósitos manuales).
✅ Transferencia SPEI (depósito a la CLABE de la cuenta Finsus).
✅ Depósitos en comercios autorizados (con código de referencia).
✅ Para migrantes: Depósitos con una tarjeta internacional habilitada.
●	Todos estos medios son proporcionados por la plataforma de Finsus.
4.	Uso del Saldo en Constructoken
●	El saldo se podrá utilizar cuando:
○	Se llega a la meta de ahorro en una etapa del proyecto y el usuario decide ejecutar la construcción.
○	Se elige la opción de pagar con la Wallet directamente desde el Marketplace.
5.	Retiro de Dinero
●	Si el usuario desea retirar su dinero, deberá hacerlo desde la aplicación de Finsus.
●	Constructoken no permite retiros, solo muestra el saldo y los movimientos de la cuenta Finsus.
6.	Integración con API de Finsus
●	Todos los datos en el módulo de Wallet provienen de la API de Finsus, incluyendo:
○	Saldo total disponible.
○	Intereses ganados.
○	Depósitos realizados.
○	Compras en Constructoken.
○	Retiros (registrados en la app de Finsus).
7.	Impacto del Pago con Construpagos
●	Si el usuario decide pagar una etapa con Construpagos (ahorro progresivo en la Wallet), el precio de la etapa se recalcula.
●	Este cálculo se basa en un modelo de Machine Learning que predice el aumento de costos de materiales en función del plazo de pago.
●	Esto permite que el usuario conozca el precio estimado futuro y no se vea afectado por incrementos inesperados.
8.	Relacionado con créditos (aun no definido). Es probable que el pago de los créditos se realicen a la cuenta de Finsus de cada usuario y se tome ese dinero para el crédito. Y en la devolución de créditos se haría a través de la misma cuenta Finsus.
9.	Historial. Es importante tener el historial de forma interna para saber el comportamiento del usuario en cuanto a sus metas financieras y poder adquisitivo. De este modo se pueden ofrecer créditos de forma gradual.

Requerimientos funcionales:

- Apertura de cuenta Finsus en la misma aplicación de Constructoken
- Vista del total disponible y  línea de progreso si hay una meta activa.
- Historial de transacciones con la visualización de depósitos, rendimientos y movimientos.
- Depósitos y domiciliaciones. (Construpagos)
- Uso del saldo en Constructoken.
- Integración con la API de Finsus, la cual habilita mucho de lo mencionado anteriormente.
- Recalculación del precio si se usa Construpagos para pagar una etapa del proyecto.


e)	Créditos: 

Descripción: Módulo de financiamiento donde los usuarios pueden solicitar préstamos para su construcción y puedan terminar más rápido o puedan hacer más. Los créditos son oportunidades que se obtienen o se puede iniciar el proceso de solicitud, por lo que este módulo solo aparece cuando ya hay un crédito contratado. El crédito está diseñado para que se devuelva un porcentaje de los intereses pagados si el cliente es puntual con los pagos, siendo competitivo con créditos hipotecarios.


Logica:

1.	Aparición del Módulo de Créditos
●	El módulo solo aparece cuando el usuario ha contratado un crédito.
●	Se puede contratar un crédito de dos formas:
✅ Oportunidad automática: La plataforma identifica cuándo el usuario es elegible y le ofrece un crédito.
✅ Solicitud manual: El usuario inicia la solicitud en:
○	Dentro de opciones de pago de proyectos.
○	Página web de Constructoken.
○	(Opcional) Banner o botón dentro de la app.
2.	Pago de Cuotas
●	El pago de cuotas se realiza automáticamente desde la cuenta Finsus del usuario.
●	El usuario no tiene que hacer pagos manuales, ya que el sistema toma el dinero de la cuenta Finsus y lo dirige al crédito.
3.	Reembolso de Intereses
●	Si el usuario cumple con los pagos en tiempo y forma, al finalizar el crédito recibe un reembolso de intereses acumulado.
●	El reembolso se deposita en la cuenta Finsus.
4.	Restricción de Créditos Activos
●	Solo se puede solicitar un crédito a la vez.
●	Hasta que el crédito actual sea liquidado, el usuario no puede pedir otro.
5.	Historial. Es necesario tener un historial de los pagos de los créditos de forma interna para saber el comportamiento del usuario, poder desarrollar reportes como rollrates y cosechas. De este modo tener acciones de cobranza y poder ofrecer nuevos créditos basados en el riesgo que representa cada usuario.

Requerimientos funcionales:

- El módulo solo aparece si hay un crédito contratado.
- Pagos automáticos desde la cuenta Finsus.
- Visualización del detalle del crédito.
- Reembolso de intereses al finalizar el crédito.
- Restricción de un solo crédito activo.


f)	Funcionalidades generales y perfil

Descripción: Son requerimientos adicionales que debe de contar la aplicación con el fin del correcto y eficiente funcionamiento. 


Requerimientos funcionales:

-Notificaciones para confirmaciones, promociones y recordatorios.
-Modulo de cuenta:
	-Perfil: puede cambiar su nombre, correo o telefono
	-Ubicación: Cambiar la ubicación
	-Soporte: hablar con un asesor de constructoken, lo dirige a un whats app, correo o teléfono. 
	-Legales: puede ver el aviso de privacidad, términos y condiciones y los contratos. 
	-Configuración: cambiar contraseña
	-Cerrar sesión 


4.2 Portal tiendas de materiales

La plataforma de Constructoken para tiendas de materiales está diseñada para facilitar la gestión de pedidos, compras y administración del negocio, evolucionando hacia un SaaS integral para la operación eficiente de las tiendas.
Inicialmente, permite a las tiendas recibir pedidos de usuarios, comprar productos directamente a Constructoken y gestionar su catálogo de productos disponibles. A futuro, se expandirá con herramientas avanzadas de administración.

Para MVP:

a)	Recibir pedidos

Descripción:  Las tiendas podrán recibir y gestionar las órdenes de compra realizadas a través de Constructoken, permitiéndoles confirmar, rechazar y dar seguimiento al estado de cada pedido.


Logica:

1.	Recepción de Pedidos:
●	Al generarse una orden en Constructoken, el sistema la redirige automáticamente al portal de la tienda correspondiente según la ubicación y zona de cobertura.
2.	Visualización y Gestión:
●	La tienda visualiza un listado de pedidos con información clave (productos, cantidades, datos de envío, fecha de solicitud).
●	Se pueden aplicar filtros (estado, fecha, prioridad) para gestionar eficientemente los pedidos.
3.	Actualización de Estado:
●	La tienda tiene la opción de confirmar, rechazar o actualizar el estado del pedido (pendiente, en proceso, enviado, entregado, cancelado).
●	Notificaciones automáticas se envían tanto al proveedor como al usuario final para informar sobre cambios en el estado del pedido.
4.	Interacción y Soporte:
●	La interfaz permite agregar notas o comentarios a cada pedido para coordinar detalles logísticos o resolver incidencias.

Requerimientos funcionales

-Listado de pedidos recibidos con detalles (producto, cantidad, datos del comprador, dirección de entrega).
-Filtros y búsqueda por estado, fecha y otros parámetros.
-Funcionalidad para confirmar, rechazar y actualizar el estado del pedido.
-Notificaciones automáticas de cambios en el estado del pedido.
-Registro de historial de gestión de cada pedido.

b)	Comprar productos

Descripción: Se habilitará un Marketplace donde las tiendas podrán adquirir materiales de Constructoken para revender o abastecer su inventario.


Logica: 

1.	Acceso al Marketplace para Tiendas:
●	La tienda ingresa a un espacio dedicado en el portal donde se muestran los materiales y productos ofertados por Constructoken.
2.	Exploración y Selección:
●	Los productos se presentan con descripciones, imágenes, precios y condiciones de envío.
●	Se permite la búsqueda y el filtrado por categorías, precio, disponibilidad y otros criterios relevantes.
3.	Proceso de Compra:
●	La tienda puede agregar productos a un carrito de compra.
●	Antes de finalizar, se calcula el costo de envío basado en la distancia y las tarifas definidas por Constructoken.
●	Se ofrecen múltiples métodos de pago (tarjeta, SPEI, Wallet, Créditos si aplica).
4.	Confirmación y Seguimiento:
●	Una vez confirmada la compra, se genera una orden que se integra al sistema de gestión del portal.
●	La tienda recibe notificaciones del estado del pedido de reabastecimiento.

Requerimientos funcionales

- Interfaz dedicada para visualizar y explorar el catálogo de productos de Constructoken.
- Funcionalidad de carrito de compra para agregar y modificar productos.
- Cálculo dinámico del costo de envío al momento de la compra.
- Integración de métodos de pago.
- Confirmación de compra y generación de órdenes de reabastecimiento.
- Historial de compras realizadas y comprobantes de pago.


c)	Productos disponibles

Descripción: Las tiendas podrán registrar los productos que venden, facilitando la visibilidad dentro del ecosistema de Constructoken. En esta etapa, aún no habrá control automático de inventarios, solo un catálogo editable.

Logica: 

1.	Integración con el Catálogo Central de Constructoken:
●	La tienda podrá seleccionar productos directamente del catálogo central de Constructoken.
●	La información base de cada producto se sincroniza automáticamente para garantizar datos actualizados.
2.	Personalización y Gestión Local:
●	Una vez importados, los productos pueden ser personalizados por la tienda, permitiendo ajustar precios, promociones y disponibilidad según su estrategia comercial.
●	La tienda tendrá acceso a un panel de administración para editar, actualizar y gestionar su oferta de productos.
3.	Sincronización Periódica:
●	Se implementará un mecanismo de sincronización que actualice automáticamente la información de los productos en función del catálogo central, asegurando coherencia y actualidad.
4.	Visualización Pública:
●	Los productos gestionados en el portal se mostrarán en Constructoken, permitiendo a los usuarios (constructores) ver una oferta actualizada y consistente con los estándares del catálogo central.

Requerimientos funcionales

- Conexión y sincronización automática con el catálogo central de Constructoken.
- Funcionalidad para seleccionar productos del catálogo central e importarlos al portal de la tienda.
- Opciones para personalizar localmente precios, promociones y disponibilidad de cada producto.
- Mecanismo de actualización periódica para mantener la coherencia con el catálogo central.
- Panel de administración para gestionar y editar el catálogo de productos en tiempo real.
- Integración con la visualización pública en Constructoken, mostrando la oferta actualizada y personalizada de la tienda.

4.2.1 Futuro SaaS (Evolución de la Plataforma de tiendas de materiales)
A medida que la plataforma crezca, Constructoken incorporará herramientas avanzadas para convertirla en un SaaS completo de administración de tiendas de materiales.
1. Dashboard
●	Visualización de KPIs clave del negocio en tiempo real.
●	Acceso rápido a métricas como ventas, egresos, inventario y pedidos.
2. Marketplace (Ampliación)
●	Expansión de la compra de productos, con opciones de descuentos, financiamiento y ofertas especiales para tiendas afiliadas.
3. Ventas (Expansión por etapas)
●	Etapa 2: Seguimiento detallado del estatus de los pedidos.
●	Etapa 3: Integración de diferentes tipos de usuarios en la tienda, con la posibilidad de ofrecer créditos y apartados a clientes.
●	Etapa 4: Implementación de un Punto de Venta (POS) para gestionar ventas en tienda física.
4. Egresos
●	Control de compras, pagos de servicios, sueldos y gastos operativos.
●	Vinculación de las compras con el Marketplace para una mejor administración de costos.
5. Inventario
●	Fase 1: Las tiendas podrán agregar y administrar los materiales que venden.
●	Fase 2: Integración con el Punto de Venta (POS) para un control automatizado del stock en tiempo real.
6. Marketing
●	Sección donde Constructoken proporcionará materiales promocionales y estrategias de marketing para ayudar a las tiendas a atraer más clientes.
7. Asesoría
●	Acceso a información sobre productos, servicios y financiamiento, con guías y recomendaciones para mejorar la operación de la tienda.
8. Configuración
●	Personalización de usuarios, permisos, métodos de pago y ajustes operativos dentro de la plataforma.
9. Soporte
●	Chat y asistencia con asesores de Constructoken para resolver dudas y brindar apoyo técnico o comercial.
4.3 Dashboard de Constructoken 


Las secciones que tendrá el dashboard de constructoken va a ser el siguiente, pero se hará en diferentes etapas explicadas posteriormente.
Sección 1: Marketplace
1.	Dashboard:
○	Vista central con KPIs básicos (ventas, usuarios, pedidos, etc.)
2.	Productos:
○	Gestión del catálogo de materiales (sincronizado con el catálogo central).
3.	Inventario:
○	Control básico del stock, con actualización manual o semi-automatizada.
4.	Usuarios:
○	Administración de usuarios del marketplace (constructores, tiendas, etc.).
5.	Pedidos:
○	Gestión y seguimiento de órdenes de compra, desde la creación hasta la finalización.
6.	Pagos:
○	Registro y conciliación de transacciones (métodos de pago integrados: tarjeta, SPEI, Wallet).
7.	Reviews:
○	Recopilación y visualización de opiniones y valoraciones de los usuarios.
Sección 2: Proyectos
1.	Proyectos:
○	Gestión integral de proyectos, con énfasis en el proceso de ampliación (definición de ítems, reglas predefinidas, etapas, cálculo en tiempo real y generación de PDF).
○	Posteriormente, se ampliará para soportar proyectos de construcción completos y remodelaciones.
Sección 3: Financiamientos
1.	Construpagos:
○	Integración completa de la Wallet (cuenta Finsus): consulta de saldo, historial y uso en pagos.
2.	Construcreditos:
○	Visualización e implementación inicial del módulo de créditos (posterior a MVP, con funcionalidad básica de contratación y seguimiento de créditos).
Organización por Etapas de Implementación
Etapa 1 – MVP (Funcionalidades Esenciales)
●	Marketplace:
○	Dashboard: Vista básica de KPIs (número de usuarios, ventas, pedidos).
○	Productos: Catálogo de materiales sincronizado con el catálogo central.
○	Inventario: Control simple del stock (actualización manual o semiautomática).
○	Usuarios: Gestión básica de usuarios (CRUD, asignación de roles).
○	Pedidos: Gestión y seguimiento de órdenes (creación, estado, notificaciones).
○	Pagos: Registro de transacciones con métodos de pago esenciales (tarjeta, SPEI, Wallet).
○	Reviews: Módulo sencillo para recopilar y mostrar opiniones de los usuarios.
●	Proyectos:
○	Módulo completo orientado inicialmente a proyectos de ampliación, con reglas predefinidas para calcular cantidades de mano de obra, materiales y herramientas, división en etapas y generación de PDF con resumen y cronograma.
●	Financiamientos:
○	Construpagos: Integración completa de la Wallet (consulta de saldo, movimientos y uso para pagos).
○	Construcreditos: (Inicialmente se postergará o se implementa de forma mínima, mostrando información si el usuario tiene crédito, pero sin funcionalidades avanzadas).
Etapa 2 – Funcionalidades Avanzadas
●	Marketplace:
○	Productos: Ampliar el catálogo para incluir diseños arquitectónicos.
○	Inventario: Incorporar funciones más avanzadas de gestión, como alertas de stock o integración con sistemas externos.
○	Pagos: Mejorar la conciliación y agregar reportes de transacciones.
○	Reviews: Incorporar herramientas de moderación y análisis de feedback.
●	Proyectos:
○	Extender el módulo para incluir la planificación de construcción de casas, definiendo reglas y cálculos más detallados.
●	Financiamientos:
○	Construcreditos: Implementar el módulo de créditos, permitiendo contratación, seguimiento de cuotas y reembolso de intereses (al finalizar el crédito, si se pagan a tiempo).
Etapa 3 – Optimización y Ampliación de Servicios
●	Marketplace:
○	Productos/Inventario: Incluir servicios de mano de obra, permitiendo que el catálogo integre ofertas de contratación de profesionales de la construcción.
○	Refinar la experiencia de usuario en el dashboard y en la gestión de pedidos.
●	Proyectos:
○	Incorporar el módulo de remodelaciones, con reglas específicas y cálculos avanzados para este tipo de proyectos.
●	Financiamientos:
○	Refinar ambos módulos de financiamiento con análisis de riesgo crediticio y seguimiento avanzado de pagos.
Etapa 4 – Ampliación del Catálogo en el Marketplace
●	Marketplace:
○	Productos: Incluir nuevas categorías, como electrodomésticos y muebles, complementando la oferta para el equipamiento del hogar.
○	Ampliar las opciones de personalización y promociones para estos nuevos productos.
Etapa 5 – Funcionalidades Complementarias (A Evaluar)
●	Marketplace:
○	Implementación de módulos adicionales según evolución del negocio: Advanced Analytics, herramientas de marketing y campañas de promoción.
●	Otros módulos complementarios que se evaluarán de acuerdo a la evolución de las necesidades de la empresa y de los usuarios (soporte avanzado, configuraciones adicionales, etc.).

8. Flujos
	Marketplace: 
Proyectos:
Wallet
 

9.PROTOTIPO EN FIGMA


Constructoken 3.0


10. Consideraciones Técnicas

10.1 Tecnologías 

Constructores: Apps nativas en android y ios
Tienda de materiales: web app
Admin construction: web app

	•	Frontend: 
App constructor: Flutter. 
Web app de tienda de materiales y admin: next js
	•	Backend: FastAPI
	•	Orm: SQLAlquemy
	•	Base de Datos: PostgreSQL 
	•	Infraestructura: Render(Aun por definir)

*Despliegue dockerizado.




