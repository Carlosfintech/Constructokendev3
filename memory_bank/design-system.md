# 📘 Resumen del Design System

## ✍️ Tipografía

- Helvetica Bold 24.0pt
- Helvetica Bold 32.0pt
- Helvetica Bold 36.0pt
- Urbanist Medium 16.0pt
- Urbanist Medium 18.0pt
- Urbanist Medium 24.0pt
- Urbanist Regular 14.0pt

## 🎨 Colores

### Especial
- **Detalles-verdefgalactico**: `#00FF96` – Para ilustraciones y detalles

### Feedback
- **Feedback-Error**: `#ca5757` – Color de error o alerta
### Neutro
- **Neutro-Negro**: `#000000` – Negro para textos y elementos destacados
- **Neutro-Grisdark-606264**: `#606264` – Neutro gris
- **Neutro-Gris-8391A1**: `#8391A1` – Neutro gris
- **Neutro-Gris-DADADA**: `#DADADA` – Neutro gris
- **Neutro-Gris-F2F4F6**: `#F2F4F6` – Neutro gris
- **Neutro-Gris-CED0DE**: `#CED0DE` – Neutro gris
- **Neutro-Gris-F0F0F0**: `#F0F0F0` – Neutro gris
- **Neutro-Gris-f8f8f8**: `#f8f8f8` – Neutro gris
- **Neutro-Blanco**: `#ffffff` – Blanco puro
### Primario
- **Primario**: `#27C584` – Color principal del sistema
### Secundario
- **Secundario-Amarillo**: `#F2C94C` – Color secundario amarillo
- **Secundario-Azul**: `#56CCF2` – Color secundario azul

## 🧩 Componentes UI

- **boton principal** (Boton): El boton principal de la aplicacion usa el color primario. Puede tener el icono a la izquierda, derecha o no tenerlo.

- **boton desabilitado** (Boton): El boton esta desabilitado

- **boton outline** (Boton): El boton sin linea se usa para el inicio de sesion con gmail
- **boton ghost** (Boton): El boton ghost se usa principalmente para que reenvie el codigo

- **boton redondo ** (Boton): El boton redondo es negro y redondo con una flecha al centro color blanco.

- **Boton redondo con texto** (Boton): El boton es casi negro y se usa principalmente en el wallet 
- **Boton home** (Boton): El boton se usa en el home 
- **Botones de menu inferior** (Boton): Es el boton del menu inferior el cual se pone de color obscuro cuando esta seleccionado y un color claro cuando no esta seleccioando. El componente consta de un icono y un texto organizados verticalmente.
- **Menu inferior** (Menu): Es el menu inferior que te lleva a cada una de los modulos Home(marketplace), Proyectos, Wallet, Perfil y si tiene creditos "Creditos. 
- **Barra de navegacion** (Navegacion): Esta es la barra de navegacion superior. Muestra el titulo enmedio y puede tener una flecha en la derecha o la izquierda, cualquiera de las dos. Esta flecha te ayuda a navegar hacia atras.
- **Boton tab marketplace** (Boton): Este botos es un componente que se utiliza en la tab del marketplace cuando esta seleccionado tiene letra color negro con subrayado verde, cuando no esta seleccionado se pone en color gris. El tab del marketplace ayuda a filtrar el tipo de materiales.
- **Tab marketplace** (Menu): Este es la tab del marketplace que ayuda a filtrar por tipo de productos.
- **Checkbox redondo** (Boton): Es un checkbox redondo.
- **Checkbox cuadrado** (Boton): Es un check box cuadrado
- **Transacciones wallet** (Elemento lista): Movimientos wallet es un elemento que pertenece a la lista de transacciones del wallet. Por lo que es variable en el icono, texto de tipo de transaccion, texto de hora, y el signo y monto de la transaccion. Hay construpagos, compras y retiros. 
- **Ubicacion** (Elemento lista): componente de ubicacion
- **Pedidos** (Elemento lista): El componente de estatus de pedido pone el numero de pedido que es variable, la direccion del pedido y el estatus que puede ser en preparacion, en transito y entregado.

- **Seguimiento de pedidos** (Elemento lista): Este componente es el seguimiento dle pedido. Se muetsran tres etapas separadas por una linea. Cuando esta en preparacion se muestra el icono en color y la fecha, cuando pasa a enviado se colorea la primer linea y la segunda etapa cons su fecha, y asi mismo cuando esta en entregado. Mientras que no este en dicha etapa esta deshabilitado y no se muestra la fecha.
- **Nombre beneficiario** (Elemento lista): El componente nomre beneficiario es una fila de lista de beneficiarios que muestra el nombre del beneficiario con un botón de copia
- **Pago ** (Elemento lista): El componente CardItem representa una tarjeta bancaria dentro de una lista. Muestra información del titular, los últimos 4 dígitos de la tarjeta y un botón para editar.
- **Tipo pago** (Elemento lista): El componente Tipo pago muestra una línea de información con un título a la izquierda y un valor a la derecha. Se usa para mostrar detalles estructurados, como información de pagos, depósitos o datos transaccionales.
- **Pasarla tipo pago** (Elemento lista): El componente que muestras en las imágenes es una lista de métodos de pago seleccionables. Cada método de pago es representado por:
	1.	Un icono que varía según el método de pago.
	2.	Un texto descriptivo con el nombre del método.
	3.	Un subtítulo que puede mostrar detalles adicionales (saldo disponible, crédito, etc.).
	4.	Un checkbox redondo que permite seleccionar el método de pago.
	5.	En algunos casos, cuando se selecciona un método, se despliegan más elementos (ejemplo: campos de tarjeta de crédito).
- **Card marketplace** (Card): El componente ProductCard es una tarjeta de producto que muestra:
✅ Imagen del producto con un tamaño fijo y un borde redondeado.
✅ Título del producto con hasta 2 líneas de texto y truncamiento si es muy largo.
✅ Precio del producto con un estilo de texto resaltado.
✅ Manejo de errores en la imagen: Si la imagen no carga, muestra un Icon(Icons.error) con un fondo gris.
- **card carrito** (Card): El card carrito es un widget de Flutter que representa un artículo dentro del carrito de compras. Este componente permite mostrar los detalles de un producto y ajustar la cantidad de unidades que se desean comprar mediante botones de incremento y decremento.
- **Inputs** (Inputs): Inputs es un componente que es un campo de entrada personalizado (input) que soporta diferentes estados visuales y funcionalidades relacionadas con contraseñas.
- **Overlay** (Componente general): El componente Overlay en Flutter crea una capa semitransparente y borrosa sobre toda la pantalla. Se usa comúnmente para enfocar la atención en un contenido específico al desenfocar y oscurecer el fondo.
- **Validacion ** (Inputs): El componente OtpValidation es un widget de validación de OTP (One-Time Password), diseñado para capturar y validar códigos de autenticación de múltiples dígitos en Flutter.
- **Seleccion proyectos** (Boton): El componente ProjectSelectionButton es un botón personalizable en forma de píldora utilizado para la selección de proyectos. Puede estar en dos estados:
	1.	Estado inactivo (default)
	•	Fondo gris claro (#F2F4F6)
	•	Texto en gris oscuro (#606369)
	2.	Estado activo (seleccionado)
	•	Fondo negro (#0C0C0C)
	•	Texto en blanco

✅ Permite la selección de diferentes opciones de proyectos con una interacción táctil.

✅ Puede cambiar de estado cuando es seleccionado.

✅ Se usa en conjunto con ProjectSelectionExample, que permite seleccionar dinámicamente entre varias opciones.
- **Toast** (Componente general): El componente Toast es una notificación emergente (tipo toast) que se muestra temporalmente en la pantalla con un mensaje.

✅ Se usa para mostrar mensajes breves como confirmaciones o alertas.
✅ Aparece en la parte inferior de la pantalla y desaparece después de un tiempo.
✅ Tiene un fondo oscuro (#0C0C0C) y texto blanco.
✅ Se elimina automáticamente después de 3 segundos (por defecto).
- **Progreso credito** (Componente general): El componente CreditProgressIndicator es un indicador de progreso circular que muestra el saldo restante de un crédito.

✅ Representa el saldo pagado y pendiente en un gráfico circular.
✅ Dibuja un arco que cambia según el progreso del pago.
✅ Muestra el saldo restante en el centro del círculo.
✅ Se personaliza con colores, tamaños y estilos de texto.
- **Progreso etapa** (Componente general): El ProgressBar es un indicador de progreso horizontal que visualiza el avance de depósitos y ganancias de intereses en una barra segmentada.

✅ Representa dos tipos de progreso:
	•	🔹 Wallet Progress (azul): Representa los depósitos desde la billetera.
	•	🟡 Interest Progress (amarillo): Representa el progreso acumulado por intereses.

✅ Muestra un porcentaje en la barra de progreso.
✅ Incluye un ícono de moneda que se mueve a lo largo del progreso.
✅ Personalizable en colores, valores y porcentaje inicial.
- **Carrusell dots** (Componente general): El componente CarouselDots es un indicador de progreso visual basado en puntos o barras, que representa el avance en un proceso multi-paso o un carrusel de imágenes.

✅ Muestra un conjunto de pasos visuales con un diseño de puntos o barras.
✅ Cada paso puede estar activo o inactivo según el estado actual (currentStep).
✅ Personalizable en tamaño, colores y forma de los puntos.
✅ Puede ser interactivo, permitiendo avanzar entre pasos (CarouselDotsDemo).
- **Searcher** (Inputs): El componente SearchBar es una barra de búsqueda interactiva con diferentes estados y funcionalidades:

✅ Muestra un campo de búsqueda con un icono de lupa y placeholder.
✅ Cambia de estado dinámicamente entre default, typing y filled.
✅ Incluye un botón para limpiar la búsqueda cuando hay texto.
✅ Permite personalización del texto, eventos y aparienci
- **pasos proyecto** (Componente general): El componente ProgressCircle y sus variantes ProjectStepsProgress y CompactProjectStepsProgress son indicadores de progreso circulares que muestran el avance en un proceso de múltiples pasos.

✅ Muestra un círculo con el paso actual y el total.
✅ Indica el progreso llenando el círculo con un color.
✅ Puede representar múltiples pasos en fila o en formato compacto.
✅ El diseño es adaptable y puede personalizarse.
- **Lista resumen del pedido** (Elemento lista): Este componente muestra un elemento de la lista de un pedido realizado. 
- **Card selección en proyectos** (Card): Este componente es para seleccionar caracteristicas en el modulo de proyectos
- **Proyecto Componente** (Elemento lista): Este componente muestra el proyecto que se esta realizando en el momento.  Puede tener varios estados, el primero es que si es un proyecto personalizado se muetsra la etiqueta de diseño y si le da click se va a la pantalla de contacto con el profesional (personalizado contacto). La otra es si tiene un proyecto activo en el que se muestra el proyecto con la etirqueta de la etapa en la que esta y la linea de progreso. Si le da click se muestra el detalle del proyecto.
- **Lista movimientos creditos** (Elemento lista): En este componente se muestran los movimientos del credito

## 🔁 Flujo General

- **Inicio** (Onboarding – nan): Es la pantalla que aparece cuando abres la aplicación. Es una pantalla negra con el logo de constructoken en blanco.
- **Onbarding 1** (Onboarding – nan): Esta pantalla es el primer paso del tutorial de 3 pasos. Consta de una ilustración, un
- **Onboarding 2** (Onboarding – nan): Esta es la pantalla dos del tutorial de la palicacion
- **Onboarding 3** (Onboarding – nan): Esta es la pantalla tres del tutorial de la palicacion
- **Registro** (Inicio de sesion/registro – Registro): Esta es la pantalla para registrarse en constructoken
- **Iniciar sesión** (Inicio de sesion/registro – Iniciar sesion): Esta pantalla es la de inicio de la sesión
- **Restablecer contraseña** (Inicio de sesion/registro – restablecer contraseña): En esta pantalla se incia el proceso de restablecer la contraseña.
- **Restablecer contraseña confirmacion** (Inicio de sesion/registro – restablecer contraseña): Esta pantalla es cuando el usuario esta tratando de recuperar contraseña y ya recibio el link a su correo.
- **Confirmación teléfono** (Inicio de sesion/registro – confirmacion telefono): Esta pantalla es para recibir el numero que se va a confirmar 
- **Codigo de confirmacion de telefono** (Inicio de sesion/registro – confirmacion telefono): En esta pantalla se coloca el codigo de verificiacion que se envio por mensaje al telefono
- **Ubicacion** (Funcion general – Ubicacion): En esta pantalla el usuario indica la ubicación para que el sistema sepa el catalogo a mostrar en el marketplace y saber la ubicacion de su proyecto.
- **Marketplace home** (Marketplace – Home): En esta pantalla es el home. Se muestra en la parte superior la bienvenida al usuario y del otro lado los pedidos y el carrito. Deaspues se muestra un input de buscador, el cual funciona que mientras escribes te muestra los productos disponibles y si no hay un mensaje de que no se encontro la busqueda (esas pantallas tienen un diseño especifico) Abajo se muestra un carrusel con banners de promociones el cual el admin podra cambiar desde el panel de admin. Mas abajo aparece el boton de crear un proyecto y otro de ir a todos los materiales. 
Al final se muestran dos secciones con productos como lo es lo más vendido y lo nuevo, estos productos mostrados se puede hacer scroll horizontal, y aunque estas listas son importates la idea es que se puedan agregar mas secciones o listas en el futuro. En la parte inferior de la pantalla se muestra el menú.
- **Search marketplace** (Marketplace – Productos): Es un proceso de pantallas que te muestra la busqueda mientras vas escribiendo y si no encuentra nada te menciona que no se encontro nada.
- **Todos los productos** (Marketplace – Productos): Es la pantalla donde se muestran todos los productos. esta pantalla cuenta con la navbar arriba y con los pedidos y el carrito. Tambien tiene un input de busqueda. Incluye un menu con las categorias para buscar productos. Y se muestran en cards todos los productos disponibles y si se le pone un filtro muestra los corresponsientes a ese filtro.
- **Producto** (Marketplace – Productos): Es la pantalla donde se muestra la informacion del producto en el marketplace. muestra el titulo, fotos del producto, descripcion y caracteristicas. En la parte inferior puedes sumar y restar la cantidad que quieres llevar al carrito de compras. Y tambien tiene un boton principal para agregar al carrito el producto.
- **Carrito** (Marketplace – Carrito): En esta pantalla lalmada carrito de compra se van compilando todos los productos (cons su respectivas cantidades) que quiere comprar el usuario. Ahi mismo el usuario puede sumar o restar cantidad de productos, o tambien los puede eliminar. Se muestra el total monetario d ela compra y el usuario con el boton puede continuar la compra.
- **Entrega ** (Marketplace – Pedido): En esta pantalla despues de seleccionar los productos en el carrito el usuario podra colocar la fecha hora y la persona que recibe.
- **Pasarela de pago** (Marketplace – Pedido): En esta pantalla se muestra la pasarela de pago. Se puede pagar con el Monedero que es el del wallet de la app, aqui se muestra el monto que tienes disponible y si no ha habido cuenta puedes elegirlo para abrir tu wallet. La segunda opcion es el credito que te muestra el credito que tienes autorizado y si no tienes credito puedes iniciar el proceso de originacion de credito. La tercera es con tarjeta de credito en donde se abre para que pongas todos los datos de tu tarjeta de credito. También puedes pagar con paypal. 
- **Confirmacion de pedido** (Marketplace – Pedido): Es la pantalla de confirmacion del pedido cuando el pago fue aprobado.
- **Pedidos** (Marketplace – Pedido): En esta pantalla se muestran los pedidos. 
- **Seguimiento de pedidos** (Marketplace – Pedido): En esta pantalla se ve el deatlle del pedido. Muestra el estatus del pedido, muestra la direccion, metodo de pago y resumen dle pedido. Reutiliza varios componentes por lo que es muy importante considerarlos, en especial el de seguimiento de productos que muestra tres etapas separadas por una linea. Cuando esta en preparacion se muestra el icono en color y la fecha, cuando pasa a enviado se colorea la primer linea y la segunda etapa cons su fecha, y asi mismo cuando esta en entregado. Mientras que no este en dicha etapa esta deshabilitado y no se muestra la fecha. Es muy importante ya que este elemento debe tener relacion con el backend.
- **Inicio de proyecto** (Proyecto – Proyectos): Esta es la pantalla de inicio de proyectos cuando aun no se ha creado ningun proyecto.
- **Proyectos** (Proyecto – Proyectos): En esta pantalla se muestran todos los proyectos que se pueden realizar. Son varias formas en que se puede realizar un proyecto, la primera es através de crear un proyecto de ampliación en el que se trata de hacer un cuarto, cocina, estancia, baño, local, etc. Puede ser una construcción en donde se va a realizar una casa (en donde tenemos proyectos de casa de manera progresiva). En estas opciones el usuario va eligiendo materiales y las caracteristicas de la vivienda. Otra opción es seleccionar la opcion de un proyecto personalizado en donnde se contacta con un asesor.Y pro ultimo el usuario puede hacer proyectos predeterminados pero el usuario no puede elegir las caracteristicas. 
- **Nombre del proyecto** (Proyecto – Caracteristicas de proyecto): Esta pantalla es para ponerle nombre al proyecto
- **Proyectos_ampliacion** (Proyecto – Caracteristicas de proyecto): En esta pantalla se puede elegir el tipo de proyecto de ampliación.
- **Proyecto_ampliación_ubicacion** (Proyecto – Caracteristicas de proyecto): En esta pantalla el usuario decide donde va a construir su ampliación. De modo que se puede saber las carácteristicas del proyecto. 
- **Proyecto_ampliación_medidas** (Proyecto – Caracteristicas de proyecto): En esta pantalla se colocan las medidas del la ampliación. De este modo se puede empezar a hacer los calculos del proyecto. 
- **Proyecto_ampliacion_paredes** (Proyecto – Caracteristicas de proyecto): En esta pantalla el usuario selecciona los materiales de las paredes. 
- **Detalle productos** (Proyecto – Caracteristicas de proyecto): En esta pantalla se muestran las caracteristicas de cada producto de la pantalla o seccion. Y se muestra como una pantalla deslizable.
- **Proyecto_ampliacion_canceleria** (Proyecto – Caracteristicas de proyecto): En esta pantalla el usuario selecciona las opciones de canceleria.
- **Proyecto_ampliacion_acabados** (Proyecto – Caracteristicas de proyecto): En esta pantalla el usuario elige los acabados como el techo, piso, interiores, exteriores y pintura.
- **Servicios - cotizacion del proyecto** (Proyecto – Caracteristicas de proyecto): En esta pantalla el usuario decide que es lo que quisiera pagar, si mano de obra, materiales, mano de obra y materieales, o servicio si construye desde el extranjero.
- **Proyecto creado** (Proyecto – Proyectos): En esta pantalla se avisa al usuario que su proyecto esta listo y se le menciona el monto total de acuerdo a lo que selecciono en la pantalla anterior.
- **Detalle del proyecto** (Proyecto – Proyectos): En esta pantalla se ve el deatlle del proyecto: el monto total, nombre, ubicación, etapas con su linea de progreso, archivos descargables y contactar con constructoken.
- **Pagar proyecto** (Proyecto – Proyectos): En esta pantalla el usuario decide como pagar su proyecto
- **Proyecto personalizado** (Proyecto – Proyectos): En esta pantalla el usuario puede empezar si proceso para su proyecto personalizado con ayuda de un profesional. Tiene que colocar el nombre de su proyecto posteriormente podrá contactar con el profesional.
- **Personalizado contacto** (Proyecto – Proyectos): En esta pantalla el usuario puede contactar con un profesional para hacer su proyecto. 
- **Proyectos** (Proyecto – Proyectos): En esta pantalla el usuario puede ver sus proyectos, pero solo puede tener uno a la vez por el momneto. Puede tener varios estados, el primero es que si es un proyecto personalizado se muetsra la etiqueta de diseño y si le da click se va a la pantalla de contacto con el profesional (personalizado contacto). La otra es si tiene un proyecto activo en el que se muestra el proyecto con la etirqueta de la etapa en la que esta y la linea de progreso.Si le da click se muestra el detalle del proyecto. Abajo de la pantalla muestra el menu.
- **Edicion de proyecto** (Proyecto – Proyectos): En esta pantalla se puede editar algunos datos del proyecto como el nombre y en caso de que esten construpagos activos tambien se podrán modificar las etapas que no hayan finalizado. Tambien se puede elimianr el proyecto siempre y cuando no tenga un credito activo.
- **Eliminar proyecto** (Proyecto – Proyectos): En esta pantalla se muestra la confirmación en caso de que el usuario quiera eliminar un proyecto.

- **Meta completada** (Proyecto – Proyectos): En cuanto una meta es completada ya sea por construpagos y la wallet o por un credito. Se muestra que se llego a la meta para que despues los materiales de dicha etapa se envien al marketplace.
- **Compra de etapa completada** (Proyecto – Proyectos): En cuanto la compra de una etapa se completa al usario se le pregunat si quiere continuar de la misma forma o bien quiere elegir otra foma de pagar la siguiente etapa.
- **Construpagos** (Proyecto – Construpagos): Cuando el usuario decide pagar con construpagos puede decidir el plazo en meses (hasta xx meses dependiendo el proyecto). De acuerdo al plazo de mueve la variable de monto total y monto mensual. Esto es calculado de acuerdo a un modelo de machine learning previamente corrido de modo que se sepa los montos totales y mensuales.  
- **Detalle construpagos** (Proyecto – Construpagos): En esta pantalla se muestra en caso de que el usuario quiera definir el plazo de cada etapa. 

- **Confirmacion construpagos** (Proyecto – Construpagos): Aqui se confirma que se van a realizar los construpagos.


- **Realizar construpago** (Proyecto – Pagos): En esta pantalla puedes hacer construpagos siempre y cuando ya se haya dado de alta el wallet.

- **Confirmación construpago** (Proyecto – Construpagos): En esta pantalla se confirma al usuario que su construpago fue exitoso.
- **Onboarding cuenta finsus 1** (Wallet – Onboarding): En esta pantalla se muestra el onboarding para hacer una cuenta finsus integrada con constructoken. Se abre en webview.

- **Onboarding cuenta finsus 2** (Wallet – Onboarding): En esta pantalla se muestra el onboarding para hacer una cuenta finsus integrada con constructoken. Se abre en webview.

- **Onboarding cuenta finsus 3** (Wallet – Onboarding): En esta pantalla se muestra el onboarding para hacer una cuenta finsus integrada con constructoken. Se abre en webview.

- **Confrimacion de cuenta finsus** (Wallet – Onboarding): Esta pantalla se muestra al tener confirmada la cuenta finsus.
- **Wallet** (Wallet – Wallet): Esta pantalla tiene tres estados, el primero es cuando no ha habilitado su cuenta el usuario: se muestra en 0 la cuenta, y se anima al usuario a dar de alta la wallet. La segunda es cuando ya la habilito el usuario, ya puede tener saldo, puede ir a la webview de su cuenta finsus, puede hacer construpagos, comprar y ver el historial de las transacciones. El tercero, hace lo mismo pero se ve una linea de progreso si hay un proyecto activo. 
- **Wallet-construpago** (Wallet – Wallet): En esta pantalla se pueden hacer construpagos y se puede hacer pos spei o tajeta de debito/credito. En caso de que sea spei se muestra un toast avisando que ya se copio.
- **Tarjetas registrads** (Wallet – Pagos): En esta pantalla se muestran las tarjetas que se han registrado para hacer pagos.  Se puede elegir una de las ya registradas para continuar con el pago. También se puede editar las tarjetas para automatizar los pagos o quitar la automatización. Tambien puedes eliminar dicha tarjeta.
- **Detalle tarjeta registrada** (Wallet – Pagos): En esta pantalla se muestra el detalle de la tarjeta, puedes editar las tarjetas para automatizar los pagos o quitar la automatización. Tambien puedes eliminar dicha tarjeta
- **Transacciones_construpago** (Wallet – Transacciones): Esta pantalla se muestra el detalle de la transaccion cuando es un construpago
- **Transacciones_compra** (Wallet – Transacciones): Esta pantalla se muestra el detalle de la transaccion cuando es una compra
- **Oportunidad de crédito** (Credito – Oportunidad): En esta pantalla se le muestra al usuario la oportunidad de tener un crédito. Esto pasa siempre y cuando internamente constructoken lo autorice.
- **Caracteristicas del crédito** (Credito – Solicitud): En esta pantalla se muestran las carácteristicas principales del crédito al empezar la solicitud el crédito.

- **Solicitud de crédito** (Credito – Solicitud): En esta pantalla es un ejemplo de cómo podria ser la solicitud de crédito. Utiliza varios inputs para conocer al cliente.
- **Credito en revisión** (Credito – Solicitud): En esta pantalla se muestra que el crédito esta en revisión después de que el usuario haya hecho la solicitud. 
- **Credito no aprobado** (Credito – Solicitud): Esta pantalla muestra cuando el crédito no ha sido aprobado.
- **Credito aprobado** (Credito – Solicitud): Esta pantalla se muestra cuando el crédito ha sido aprobado.
- **Propuesta de crédito** (Credito – Contratación): En esta pantalla se muestra la propuesta
- **Contrato de crédito** (Credito – Contratación): En esta pantalla se muestra el contrato para continuar con la firma del contrato.
- **Credito ** (Credito – Credito): En esta pantalla se muestra la vista principal del credito y donde puedes hacer varias acciones. Tiene dos estados principales, cuando aun no ocupas el dinero del credito para comprar en Constructoken te marca el saldo disponible para comprar y cuando ya se ocupa la totalidad del saldo para comprar te muestra el saldo pendiente del crédito.
- **Pago credito** (Credito – Credito): En esta pantalla se muestra como abonar al crédito. Al copiar la cuenta CLABE te lo notifica con toast.

- **Detalle credito** (Credito – Credito): En esta pantalla se muestra el detalle del crédito, tiene un boton para ver la información general y otra para ver los movimientos.
- **Finaliza el credito** (Credito – Credito): Se muestra esta pantalla cuando se ha pagado el crédito en su totalidad.
- **Cuenta** (Cuenta – Cuenta): Se muestra el menu de la cuenta
- **Perfil** (Cuenta – Perfil): En esta pantalla se muestra la foto, el nombre, el correo y el teléfono del usuario.  Puede cambiar el teléfono registrado, para el cual tiene que completar el proceso de confirmación del teléfono.

- **Actualizar ubicación** (Cuenta – Ubicacion): En esta pantalla el usuario puede ver la ubicación guardada y puede cambiarla. Si la cambia tiene que cambiar la ubicación de la aplicación desde el marketplace. No obstante no cambia en los proyectos que ya hayan iniciado o que hayan finalizado.

- **Legales** (Cuenta – Legales): En esta pantalla se ven todos los legales así como los contratos.
- **Soporte** (Cuenta – Soporte): En esta pantalla el usuario puede comunicarse con constructoken por diferentes medios.
- **Configuracion** (Cuenta – Configuración): En esta pantalla el usuario puede modificar su contraseña. Tiene varios estados como cuando no coincide la constraseña anterior. También tiene un toast cuando la contraseña ha sido actualizada.
