/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
Procesos almacenados del Modulo ventas
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
-- PROCESOS TABLA VENTAS --
-- PROCESO DELETE TABLA VENTAS
delimiter //
create procedure mv_del_ventas(
in `pi_cod_venta` bigint(11)
)
begin
delete from ventas
where cod_venta =pi_cod_venta;
end; //

-- PROCESO SELECT TABLA VENTAS
delimiter //
create procedure mv_sel_ventas(
in `pi_cod_venta` bigint(11)
)
begin
select *from ventas
where cod_venta like CONCAT('%',pi_cod_venta,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA VENTAS
delimiter //
create procedure mv_sel_todo_ventas() begin
start transaction;
select *from ventas
commit;
end; //

-- PROCESO INSERT TABLA VENTAS
delimiter //
create procedure mv_ins_ventas(
in `cod_venta` bigint (11),
in `cod_usuario`  bigint (11),
in `cod_cliente` bigint(11),
in `fecha_creacion` datetime
)
begin
INSERT INTO ventas(
 cod_venta
  ,cod_usuario
  ,cliente_id
  ,fecha_creacion
) VALUES (
  cod_venta
  ,cod_usuario
  ,cod_cliente
  ,now()
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA VENTAS
select @cod_venta:= max(cod_venta) from ventas;
end; //

-- PROCESO UPDATE TABLA DE VENTA
delimiter //
 create procedure mv_upd_ventas(
 in `pi_cod_venta` bigint(11),
 in `pi_cod_usuario`  bigint(11),
 in `pi_cliente_id` int(11)
 )
begin
 UPDATE ventas
SET
 cod_venta=pi_cod_venta
  ,cod_usuario = pi_cod_usuario
  ,cliente_id = pi_cliente_id
  ,fecha_creacion= now()
WHERE cod_venta = pi_cod_venta;
end; //

-- PROCESOS TABLA DETALLE VENTAS --
-- PROCESO DELETE TABLA DETALLE VENTAS
delimiter //
create procedure mv_del_detalle_ventas(
in `pi_cod_detalle_venta` bigint(11)
)
begin
delete from detalle_venta
where cod_detalle_venta =pi_cod_detalle_venta;
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA VENTAS
delimiter //
create procedure mv_sel_todo_detalle_ventas() begin
start transaction;
select *from detalle_venta
commit;
end; //

-- PROCESO SELECT TABLA DETALLE VENTAS
delimiter //
create procedure mv_sel_detalle_venta(
in `pi_cod_detalle_venta` bigint(11)
)
begin
select *from detalle_venta
where cod_detalle_venta like CONCAT('%',pi_cod_detalle_venta,'%');
end; //

-- PROCESO INSERT TABLA DETALLE VENTA
delimiter // 
create procedure mv_ins_detalle_ventas(
in `cod_detalle_venta` bigint(11),
in `cod_venta` bigint(11),
in `cod_producto` int(11),
in `cantidad` int(11),
in `precio_venta` decimal(10,2),
in `descuento` decimal(10,2),
in `impuesto_sobre_venta` decimal(10,2),
in `subtotal` decimal(10,2)
)
begin
INSERT INTO detalle_venta(
  cod_detalle_venta
  ,cod_venta
  ,cod_producto
  ,cantidad
  ,precio_venta
  ,descuento
  ,impuesto_sobre_venta
  ,subtotal
) VALUES (
  cod_detalle_venta
  ,cod_venta
  ,cod_producto
  ,cantidad
  ,precio_venta
  ,descuento
  ,impuesto_sobre_venta
  ,subtotal
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA VENTAS
select @cod_detalle_venta:= max(cod_detalle_venta) from detalle_venta;
end; //

-- PROCESO UPDATE TABLA DE DETALLE VENTA
delimiter //
 create procedure mv_upd_detalle_ventas(
 in `pi_cod_detalle_venta` bigint(11),
 in `pi_cod_venta` bigint(11),
 in `pi_cod_producto` int(11),
 in `pi_cantidad` int(11),
 in `pd_precio_venta` decimal(10,2),
 in `pd_descuento` decimal(10,2),
 in `pd_impuesto_sobre_venta` decimal(10,2),
 in `pd_subtotal` decimal(10,2)
 )
begin
 UPDATE detalle_venta
SET
    cod_detalle_venta=pi_cod_detalle_venta
  ,cod_venta = pi_cod_venta
  ,cod_producto=pi_cod_producto
  ,cantidad=pi_cantidad
  ,precio_venta=pd_precio_venta
  ,descuento=pd_descuento
  ,impuesto_sobre_venta=pd_impuesto_sobre_venta
  ,subtotal=pd_subtotal
WHERE cod_detalle_venta = pi_cod_detalle_venta;
end; //

/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
Procesos almacenados del Modulo Empleados
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
-- INGRESO A LA API
delimiter //
create procedure me_sel_val_dni_todo_api_usuario(
in `pv_dni_usuario` varchar(15)
)
begin
select * from usuario_registro 
where dni_usuario like CONCAT('%',pv_dni_usuario,'%');
end; //

-- PROCESO SELECT TABLA REGISTRO USUARIO
delimiter //
create procedure me_sel_usuario(
in `pi_cod_usuario` int(11)
)
begin
select * from usuario_registro
where cod_usuario like CONCAT('%',pi_cod_usuario,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA REGISTRO USUARIO
delimiter //
create procedure me_sel_todo_usuario() begin
start transaction;
select *from usuario_registro
commit;
end; //

-- PROCESO SELECT TABLA PAGO SALARIO
delimiter //
create procedure me_sel_pago_salario(
in `pi_cod_pago` int(11)
)
begin
select * from pago_salario
where cod_pago like CONCAT('%',pi_cod_pago,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA PAGO SALARIO
delimiter //
create procedure me_sel_todo_pago_salario() begin
start transaction;
select *from pago_salario
commit;
end; //

-- PROCESO SELECT TABLA REGISTRO OPERACION
delimiter //
create procedure me_sel_registro_operacion(
in `pi_cod_operacion` int(11)
)
begin
select * from registro_operacion
where cod_operacion like CONCAT('%',pi_cod_operacion,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA REGISTRO OPERACION
delimiter //
create procedure me_sel_todo_registro_operacion() begin
start transaction;
select *from registro_operacion
commit;
end; //

-- PROCESO SELECT TABLA TIPO OPERACION 
delimiter //
create procedure me_sel_tipo_operacion(
in `pi_cod_tipo_operacion` int(11)
)
begin
select * from tipo_operacion
where cod_tipo_operacion like CONCAT('%',pi_cod_tipo_operacion,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA TIPO OPERACION 
delimiter //
create procedure me_sel_todo_tipo_operacion() begin
start transaction;
select *from tipo_operacion
commit;
end; //

-- PROCESO SELCET TABLA ROL USUARIO
delimiter //
create procedure me_sel_rol_usuario(
in `pi_cod_rol` int(11)
)
begin
select * from rol_usuario
where cod_rol like CONCAT('%',pi_cod_rol,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA ROL USUARIO
delimiter //
create procedure me_sel_todo_rol_usuario() begin
start transaction;
select *from rol_usuario
commit;
end; //

-- PROCESO INSERT REGISTRO USUARIO
delimiter //
create procedure me_ins_usuario_registro(
in `cod_usuario` int(11),
in `dni_usuario` varchar(15),
in `rol`        int(11),
in `contrasena` text,
in `fecha` datetime,
in `nombre` varchar(100),
in `apellido` varchar(100),
in `num_telefono` varchar(100),
in `correo_electronico` varchar(100),
in `departamento` varchar(4),
in `municipio` varchar(4),
in `direccion` varchar(255)
)
begin
INSERT INTO usuario_registro(
  cod_usuario
  ,dni_usuario
  ,cod_rol
  ,contrasena
  ,fecha
  ,nombre
  ,apellido
  ,num_telefono
  ,correo_electronico
  ,departamento
  ,municipio
  ,direccion
) VALUES (
 cod_usuario
  ,dni_usuario
  ,rol
  ,contrasena
  ,fecha
  ,nombre
  ,apellido
  ,num_telefono
  ,correo_electronico
  ,departamento
  ,municipio
  ,direccion
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA USUARIO REGISTRO
select @cod_usuario:= max(cod_usuario) from usuario_registro;
end; //

-- PROCESO INSERT PAGO SALARIO
delimiter //
create procedure me_ins_pago_salario(
in cod_pago int(11),
in cod_usuario int(11),
 in sueldo_bruto int(11),
 in IHSS int(11),
 in RAP int(11),
 in otras_deducciones int(11),
 in vacaciones int(11),
 in descripcion_vacaciones varchar(50),
 in salario decimal(10,2)
)
begin
INSERT INTO pago_salario(
 cod_pago,
 cod_usuario,
 sueldo_bruto,
 IHSS,
 RAP,
 otras_deducciones,
 vacaciones,
 descripcion_vacaciones,
 salario
)VALUES (
cod_pago,
cod_usuario,
 sueldo_bruto,
 IHSS,
 RAP,
 otras_deducciones,
 vacaciones,
 descripcion_vacaciones,
 salario
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA PAGO SALARIO
select @cod_pago:= max(cod_pago) from pago_salario;
end; //

-- PROCESO INSERT REGISTRO OPERACION
delimiter //
create procedure me_ins_registro_operacion(
 in cod_operacion int(11),
 in cod_usuario int(11),
 in fecha_operacion datetime,
 in cod_tipo_operacion int(11),
 in referencia_operacion varchar(50)
)
begin
INSERT INTO registro_operacion(
 cod_operacion,
 cod_usuario,
 fecha_operacion,
 cod_tipo_operacion,
 referencia_operacion
)VALUES (
 cod_operacion,
 cod_usuario,
 fecha_operacion,
 cod_tipo_operacion,
 referencia_operacion
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA REGISTRO OPERACION
select @cod_operacion:= max(cod_operacion) from registro_operacion;
end; //

-- PROCESO INSERT TIPO OPERACION
delimiter //
create procedure me_ins_tipo_operacion(
in `cod_tipo_operacion` int(11),
in `nom_operacion` varchar(30)
)
begin
INSERT INTO tipo_operacion(
cod_tipo_operacion,
nom_operacion
)VALUES (
cod_tipo_operacion,
nom_operacion
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA TIPO OPERACION
select @cod_tipo_operacion:= max(cod_tipo_operacion) from tipo_operacion;
end; //

-- PROCESO INSERT ROL USUARIO
delimiter //
create procedure me_ins_rol_usuario(
in `cod_rol` int(11),
in `tipo_rol` varchar(50)
)
begin
INSERT INTO rol_usuario(
cod_rol,
tipo_rol
)VALUES (
cod_rol,
tipo_rol
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA TROL USUARIO
select @cod_rol:= max(cod_rol) from rol_usuario;
end; //

-- PROCESO UPDATE TABLA REGISTRO USUARIO
delimiter //
create procedure me_upd_registro_usuario(
 in cod_usr int(11),
 in dni 	 varchar(15),
 in rol 	 int(11),
 in contra 	 text,
 in fecha      datetime,
 in nom        varchar(100),
 in ape        varchar(100),
 in num_tele   varchar(30),
 in correo 	 varchar(100),
 in dep        varchar(4),
 in muni       varchar(4),
 in direc       varchar(255)
)
begin
  UPDATE usuario_registro
  set 
    cod_usuario = cod_usr,
    dni_usuario = dni,
    cod_rol=rol,
    contrasena = contra,
    fecha = fecha,
    nombre = nom,
    apellido = ape,
    num_telefono = num_tele,
    correo_electronico = correo,
    departamento = dep,
    municipio = muni,
    direccion = direc
where cod_usuario = cod_usr;
end; //

-- PROCESO UPDATE TABLA PAGO SALARIO
delimiter //
create procedure me_upd_pago_salario(
in pi_cod_pago int(11),
in pi_cod_usuario int(11),
 in pi_sueldo int(11),
 in pi_IHS int(11),
 in pi_RAp int(11),
 in pi_otras_deduc int(11),
 in pi_vacas int(11),
 in pv_des varchar(50),
 in pv_salario decimal(10,2)
)
begin
  UPDATE pago_salario
  set
   cod_pago = pi_cod_pago,
   cod_usuario=pi_cod_usuario, 
    sueldo_bruto = pi_sueldo,
    IHSS = pi_IHS,
    RAP = pi_RAp,
    otras_deducciones = pi_otras_deduc,
    vacaciones =pi_vacas ,
    descripcion_vacaciones = pv_des,
    salario = pv_salario
    where cod_pago =pi_cod_pago;
end; // 

-- PROCESO UPDATE TABLA REGISTRO OPERACION
delimiter //
create procedure me_upd_registro_operacion(
 in cod_op int(11),
 in cod_usu int(11),
 in fecha_op datetime,
 in cod_tip_ope  int(11),
 in ref_op varchar(50)
)
begin
update registro_operacion
set 
  cod_operacion = cod_op,
    cod_usuario=cod_usu,
    fecha_operacion = fecha_op,
    cod_tipo_operacion = cod_tip_ope,
    referencia_operacion = ref_op	
    where cod_operacion = cod_op;
end; // 

-- PROCESO UPDATE TABLA TIPO OPERACION
delimiter //
create procedure me_upd_tipo_operacion(
in cod_tip int(11),
in nom_op varchar(30)
)
begin
update tipo_operacion
set
  cod_tipo_operacion = cod_tip,
   nom_operacion = nom_op
   where cod_tipo_operacion = cod_tip;
end; //

-- PROCESO UPDATE TABLA ROL USUARIO
delimiter //
create procedure me_upd_rol_usuario(
 in pi_cod_rol int(11),
 in pv_tip_rol varchar(50)
)
begin
update rol_usuario
  set
   cod_rol = pi_cod_rol,
   tipo_rol = pv_tip_rol	
   where cod_rol = pi_cod_rol;
end; //

-- PROCESO DELETE TABLA USUARIO REGISTRO
delimiter //
create procedure me_del_registro_usuario(
in `pi_cod_usuario` int(11)
)
begin
delete from usuario_registro
where cod_usuario=pi_cod_usuario;
end; //

-- PROCESO DELETE TABLA PAGO SALARIO
delimiter //
create procedure me_del_pago_salario(
in `pi_cod_pago` int(11)
)
begin
delete from pago_salario
where cod_pago=pi_cod_pago;
end; //

-- PROCESO DELETE TABLA REGISTRO OPERACION
delimiter //
create procedure me_del_registro_operacion(
in `pi_cod_operacion` int(11)
)
begin
delete from registro_operacion
where cod_operacion=pi_cod_operacion;
end; //

-- PROCESO DELETE TABLA TIPO OPERACION
delimiter //
create procedure me_del_tipo_operacion(
in `pi_cod_tipo_operacion` int(11)
)
begin
delete from tipo_operacion
where cod_tipo_operacion=pi_cod_tipo_operacion;
end; //

-- PROCESO DELETE TABLA ROL USUARIO
delimiter //
create procedure me_del_rol_usuario(
in `pi_cod_rol` int(11)
)
begin
delete from rol_usuario
where cod_rol=pi_cod_rol;
end; //

/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
Procesos alamcenados Modulo Produccion
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
-- PROCESOS TABLA PRODUCTOS --
-- PROCESO INSERT TABLA PRODUCTOS
delimiter //
create procedure mp_ins_productos(
in `cod_producto` int (11),
in `nombre_producto` varchar(100),
in `descrip_producto` varchar(255),
in `precio_producto`  decimal(10,2)
)
begin
INSERT INTO productos(
 cod_producto
  ,nombre_producto
  ,descrip_producto
  ,precio_producto
) VALUES (
  cod_producto
  ,nombre_producto
  ,descrip_producto
  ,precio_producto
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA PRODUCTOS
select @cod_producto:= max(cod_producto) from productos;
end; //

-- PROCESO UPDATE TABLA PRODUCTOS
delimiter //
 create procedure mp_upd_productos(
in `pi_cod_producto` int (11),
in `pv_nombre_producto` varchar(100),
in `pv_descrip_producto` varchar(255),
in `pd_precio_producto`  decimal(10,2)
 )
begin
 UPDATE productos
SET
 cod_producto=pi_cod_producto
  , nombre_producto= pv_nombre_producto
  ,descrip_producto = pv_descrip_producto
  ,precio_producto= pd_precio_producto
WHERE cod_producto = pi_cod_producto;
end; //

-- PROCESO DELETE TABLA PRODUCTOS
delimiter //
create procedure mp_del_productos(
in `pi_cod_producto` int(11)
)
begin
delete from productos
where cod_producto=pi_cod_producto;
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA PRODUCTOS
delimiter //
create procedure mp_sel_todo_prodcutos() begin
start transaction;
select *from productos
commit;
end; //

-- PROCESO SELECT TABLA PRODUCTOS
delimiter //
create procedure mp_sel_productos(
in `pi_cod_producto` int(11)
)
begin
select *from productos
where cod_producto like CONCAT('%',pi_cod_producto,'%');
end; //

-- PROCESOS TABLA PRODUCTOS INVENTARIO --
-- PROCESO INSERT TABLA PRODUCTOS INVENTARIO
delimiter //
create procedure mp_ins_inventario_productos(
IN cod_lote int(11),
IN cod_producto int(11),
IN fech_creacion_lote datetime,
IN fech_caducidad_lote datetime,
IN cant_lote decimal(10,2),
IN prec_vent_lote decimal(10,2)
)
begin
INSERT INTO productos_inventario(
 cod_lote
  ,cod_producto
  ,fech_creacion_lote
  ,fech_caducidad_lote
  ,cant_lote
  ,prec_vent_lote
) VALUES (
  cod_lote
  ,cod_producto
  ,fech_creacion_lote
  ,fech_caducidad_lote
  ,cant_lote
  ,prec_vent_lote
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA INVENTARIO PRODUCTOS
select @cod_lote:= max(cod_lote) from productos_inventario;
end; //

-- PROCESO UPDATE TABLA INVENTARIO PRODUCTOS
delimiter //
create procedure mp_upd_inventario_productos(
IN pi_cod_lote int(11),
IN pi_cod_producto int(11),
IN pd_fech_creacion_lote datetime,
IN pd_fech_caducidad_lote datetime,
IN pd_cant_lote decimal(10,2),
IN pd_prec_vent_lote decimal(10,2)
 )
begin
 UPDATE productos_inventario
SET
 cod_lote=pi_cod_lote
  , cod_producto= pi_cod_producto
  ,fech_creacion_lote = pd_fech_creacion_lote
  ,fech_caducidad_lote= pd_fech_caducidad_lote
  ,cant_lote=pd_cant_lote
  ,prec_vent_lote=pd_prec_vent_lote
WHERE  cod_lote= pi_cod_lote;
end; //

-- PROCESO DELETE TABLA INVENTARIO PRODUCTOS
delimiter //
create procedure mp_del_inventario_productos(
in `pi_cod_lote` int(11)
)
begin
delete from productos_inventario
where cod_lote=pi_cod_lote;
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA INVENTARIO PRODUCTOS
delimiter //
create procedure mp_sel_todo_inventario_prodcutos() begin
start transaction;
select *from productos_inventario
commit;
end; //

-- PROCESO SELECT TABLA INVETARIO PRODUCTOS
delimiter //
create procedure mp_sel_inventario_productos(
in `pi_cod_lote` int(11)
)
begin
select *from productos_inventario
where cod_lote like CONCAT('%',pi_cod_lote,'%');
end; //

/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
Procesos almacenados Modulo Inventario
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
-- PROCESO DELETE TABLA DE MATERIA PRIMA.
delimiter //
create procedure mi_del_materia_prima(
in `pi_cod_materia` int(11)
)
begin
delete from materia_prima
where cod_materia=pi_cod_materia;
end; //

-- PROCESO DELETE TABLA INVENTARIO MATERIA PRIMA.
delimiter //
create procedure mi_del_invent_materia_prima(
in `pi_cod_invent_materia_prima` int(11)
)
begin
delete from inventario_materia_prima
where cod_invent_materia_prima=pi_cod_invent_materia_prima;
end; //

-- PROCESO DELETE TABLA PRODUCTOS MATERIA PRIMA.
delimiter //
create procedure mi_del_product_materia_prima(
in `pi_cod_prod_mat_prima` int(11)
)
begin
delete from producto_materia_prima
where cod_prod_mat_prima=pi_cod_prod_mat_prima;
end; //

-- PROCESO SELECT TABLA MATERIA PRIMA
delimiter //
create procedure mi_sel_materia_prima(
in `pi_cod_materia` int(11)
)
begin
select *from materia_prima
where cod_materia like CONCAT('%',pi_cod_materia,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA MATERIA PRIMA
delimiter //
create procedure mi_sel_todo_materia_prima() begin
start transaction;
select *from materia_prima
commit;
end; //

-- PROCESO SELECT TABLA INVENTARIO MATERIA PRIMA
delimiter //
create procedure mi_sel_invent_materia_prima(
in `pi_cod_invent_materia_prima` int(11)
)
begin
select *from inventario_materia_prima
where cod_invent_materia_prima like CONCAT('%',pi_cod_invent_materia_prima,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA INVENTARIO  MATERIA PRIMA
delimiter //
create procedure mi_sel_todo_invent_materia_prima() begin
start transaction;
select *from inventario_materia_prima
commit;
end; //

-- PROCESO SELECT TABLA PRODUCTO MATERIA PRIMA
delimiter //
create procedure mi_sel_product_materia_prima(
in `pi_cod_prod_mat_prima` int(11)
)
begin
select *from producto_materia_prima
where cod_prod_mat_prima like CONCAT('%',pi_cod_prod_mat_prima,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA PRODUCTO MATERIA PRIMA
delimiter //
create procedure mi_sel_todo_product_materia_prima() begin
start transaction;
select *from producto_materia_prima
commit;
end; //

-- PROCESO INSERT TABLA MATERIA PRIMA
delimiter //
create procedure mi_ins_materia_prima(
IN cod_materia int(11),
IN nom_materia VARCHAR (100),
IN descripcion VARCHAR (255),
IN pre_Compra_materia DECIMAL (10,2),
IN tip_medida VARCHAR (10)
)
begin
INSERT INTO materia_prima(
 cod_materia
  ,nom_materia
  ,descripcion
  ,pre_Compra_materia
  ,tip_medida
) VALUES (
  cod_materia
  ,nom_materia
  ,descripcion
  ,pre_Compra_materia
  ,tip_medida
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA INVENTARIO PRODUCTOS
select @cod_materia:= max(cod_materia) from materia_prima;
end; //

-- PROCESO INSERT TABLA INVENTARIO MATERIA PRIMA
delimiter //
create procedure mi_ins_invent_materia_prima(
IN cod_invent_materia_prima int(11),
IN cod_materia int(11),
IN fec_compra  DATETIME,
IN can_Compra DECIMAL (10,2),
IN pre_compra DECIMAL (10,2),
IN fec_caducidad DATE
)
begin
INSERT INTO inventario_materia_prima(
 cod_invent_materia_prima
  ,cod_materia
  ,fec_compra
  ,can_Compra
  ,pre_compra
  ,fec_caducidad
) VALUES (
 cod_invent_materia_prima
  ,cod_materia
  ,fec_compra
  ,can_Compra
  ,pre_compra
  ,fec_caducidad
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA INVENTARIO PRODUCTOS
select @cod_invent_materia_prima:= max(cod_invent_materia_prima) from inventario_materia_prima;
end; //

-- PROCESO INSERT TABLA PRODUCTOS MATERIA PRIMA
delimiter //
create procedure mi_ins_prod_materia_prima(
IN cod_prod_mat_prima int(11),
IN cod_producto int(11),
IN cod_materia  int(11),
IN can_materia_requerida DECIMAL (10,2)
)
begin
INSERT INTO producto_materia_prima(
 cod_prod_mat_prima
  ,cod_producto
  ,cod_materia
  ,can_materia_requerida
) VALUES (
 cod_prod_mat_prima
  ,cod_producto
  ,cod_materia
  ,can_materia_requerida
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA INVENTARIO PRODUCTOS
select @cod_prod_mat_prima:= max(cod_prod_mat_prima) from producto_materia_prima;
end; //

-- PROCESO UPDATE TABLA MATERIA PRIMA
delimiter //
create procedure mi_upd_materia_prima(
IN pi_cod_materia int(11),
IN pv_nom_materia VARCHAR (100),
IN pv_descripcion VARCHAR (255),
IN pd_pre_Compra_materia DECIMAL (10,2),
IN pv_tip_medida VARCHAR (10)
 )
begin
 UPDATE materia_prima
SET
 cod_materia=pi_cod_materia
  , nom_materia= pv_nom_materia
  ,descripcion = pv_descripcion
  ,pre_Compra_materia= pd_pre_Compra_materia
  ,tip_medida=pv_tip_medida
WHERE  cod_materia= pi_cod_materia;
end; //

-- PROCESO UPDATE TABLA INVENTARIO MATERIA PRIMA
delimiter //
create procedure mi_upd_invent_materia_prima(
IN pi_cod_invent_materia_prima int(11),
IN pi_cod_materia int(11),
IN pd_fec_compra  DATETIME,
IN pd_can_Compra DECIMAL (10,2),
IN pd_pre_compra DECIMAL (10,2),
IN pd_fec_caducidad DATE
 )
begin
 UPDATE inventario_materia_prima
SET
 cod_invent_materia_prima=pi_cod_invent_materia_prima
  , cod_materia= pi_cod_materia
  ,fec_compra = pd_fec_compra
  ,can_Compra= pd_can_Compra
  ,pre_compra=pd_pre_compra
  ,fec_caducidad=pd_fec_caducidad
WHERE  cod_invent_materia_prima= pi_cod_invent_materia_prima;
end; //

-- PROCESO UPDATE TABLA PRODUCTOS MATERIA PRIMA
delimiter //
create procedure mi_upd_product_materia_prima(
IN pi_cod_prod_mat_prima int(11),
IN pi_cod_producto int(11),
IN pi_cod_materia  int(11),
IN pd_can_materia_requerida DECIMAL (10,2)
 )
begin
 UPDATE producto_materia_prima
SET
 cod_prod_mat_prima=pi_cod_prod_mat_prima
  , cod_producto= pi_cod_producto
  ,cod_materia = pi_cod_materia
  ,can_materia_requerida= pd_can_materia_requerida
WHERE  cod_prod_mat_prima= pi_cod_prod_mat_prima;
end; //

/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
Procesos almacenados del Modulo Cliente
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
-- PROCESO SELECT TABLA DEPAPARTAMENTO
delimiter //
create procedure mc_sel_departamento(
in `pv_departamento_id`  varchar(2)
)
begin
select *from departamento
where departamento_id like CONCAT('%',pv_departamento_id,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA DEPARTAMENTO
delimiter //
create procedure mc_sel_todo_departamento() begin
start transaction;
select *from departamento
commit;
end; //

-- PROCESO SELECT TABLA MUNICIPIO
delimiter //
create procedure mc_sel_municipio(
in `pv_municipio_id`  varchar(4)
)
begin
select *from municipio
where municipio_id like CONCAT('%',pv_municipio_id,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA MUNICIPIO
delimiter //
create procedure mc_sel_todo_municipio() begin
start transaction;
select *from municipio
commit;
end; //

-- PROCESO SELECT TABLA DIRECCION CLIENTE
delimiter //
create procedure mc_sel_direccion_cliente(
in `pi_direccion_id`  int(11)
)
begin
select *from direccion_cliente
where direccion_id like CONCAT('%',pi_direccion_id,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA DIRECCION CLIENTE
delimiter //
create procedure mc_sel_todo_direccion_cliente() begin
start transaction;
select *from direccion_cliente
commit;
end; //

-- PROCESO SELECT TABLA CLIENTE
delimiter //
create procedure mc_sel_cliente(
in `pi_cliente_id`  int(11)
)
begin
select *from cliente
where cliente_id like CONCAT('%',pi_cliente_id,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA CLIENTE
delimiter //
create procedure mc_sel_todo_cliente() begin
start transaction;
select *from cliente
commit;
end; //

-- PROCESO SELECT TABLA COMPAñIA
delimiter //
create procedure mc_sel_compañia(
in `pv_compania_rtn`  varchar(16)
)
begin
select *from compañia
where compania_rtn like CONCAT('%',pv_compania_rtn,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA COMPAñIA
delimiter //
create procedure mc_sel_todo_compañia() begin
start transaction;
select *from compañia
commit;
end; //

-- PROCESO SELECT TABLA COMPAñIA OFICINA
delimiter //
create procedure mc_sel_compañia_oficina(
in `pi_oficina_id`  int(11)
)
begin
select *from compañia_oficina
where oficina_id like CONCAT('%',pi_oficina_id,'%');
end; //

-- PROCESO SELECT TODOS LOS DATOS DE LA TABLA COMPAñIA OFICINA
delimiter //
create procedure mc_sel_todo_compañia_oficina() begin
start transaction;
select *from compañia_oficina
commit;
end; //

-- PROCESO DELETE TABLA DIRECCION CLIENTE
delimiter //
create procedure mc_del_direccion_cliente(
in `pi_direccion_id`  int(11)
)
begin
delete from direccion_cliente
where direccion_id=pi_direccion_id;
end; //

-- PROCESO DELETE TABLA CLIENTE
delimiter //
create procedure mc_del_cliente(
in `pi_cliente_id`  int(11)
)
begin
delete from cliente
where cliente_id=pi_cliente_id;
end; //

-- PROCESO DELETE TABLA COMPAñIA
delimiter //
create procedure mc_del_compañia(
in `pv_compania_rtn`  varchar(16)
)
begin
delete from compañia
where compania_rtn=pv_compania_rtn;
end; //

-- PROCESO DELETE TABLA COMPAñIA OFICINA
delimiter //
create procedure mc_del_compañia_oficina(
in `pi_oficina_id`  int(11)
)
begin
delete from compañia_oficina
where oficina_id=pi_oficina_id;
end; //

-- PROCESO UPDATE TABLA DIRECCION CLIENTE
delimiter //
create procedure mc_upd_direccion_cliente(
IN `pi_direccion_id`        int(11),
IN `pi_cliente_id`          int(11),
IN `pv_direccion`           varchar(255),
IN `pv_direccion_ciudad`    varchar(50),
IN `pv_municipio_id`        varchar(4),
IN `pv_departamento_id`     varchar(4),
IN `pv_direccion_telefono`  varchar(30)
 )
begin
 UPDATE direccion_cliente
SET
 direccion_id=pi_direccion_id
  , cliente_id= pi_cliente_id
  ,direccion = pv_direccion
  ,direccion_ciudad= pv_direccion_ciudad
  ,municipio_id=pv_municipio_id
  ,departamento_id=pv_departamento_id
  ,direccion_telefono=pv_direccion_telefono
WHERE  direccion_id= pi_direccion_id;
end; //

-- PROCESO UPDATE TABLA CLIENTE
delimiter //
create procedure mc_upd_cliente(
IN `pi_cliente_id`              int(11),
IN `pv_clinte_correo`           varchar(255),
IN `pt_cliente_contraseña`      text,
IN `pt_cliente_fecha`           timestamp,
IN `pv_cliente_dni`             varchar(15),
IN `pv_cliente_nombre`          varchar(100),
IN `pv_cliente_apellido`        varchar(100),
IN `pv_cliente_telefono`        varchar(30),
IN `pv_cliente_ciudad`          varchar(255),
IN `pv_cliente_direccion`       varchar(255),
IN `pv_departamento_id`         varchar(2),
IN `pv_municipio_id`            varchar(4),
IN `pv_compañia_nombre`         varchar(255),
IN `pv_compania_rtn`            varchar(255)
 )
begin
 UPDATE cliente
SET
 cliente_id=pi_cliente_id
  , clinte_correo= pv_clinte_correo
  ,cliente_contraseña = pt_cliente_contraseña
  ,cliente_fecha= pt_cliente_fecha
  ,cliente_dni=pv_cliente_dni
  ,cliente_nombre=pv_cliente_nombre
  ,cliente_apellido=pv_cliente_apellido
  ,cliente_telefono=pv_cliente_telefono
  ,cliente_ciudad=pv_cliente_ciudad
  ,cliente_direccion=pv_cliente_direccion
  ,departamento_id=pv_departamento_id
  ,municipio_id=pv_municipio_id
  ,compañia_nombre=pv_compañia_nombre
  ,compania_rtn=pv_compania_rtn
WHERE  cliente_id=pi_cliente_id ;
end; //

-- PROCESO UPDATE TABLA COMPAñIA
delimiter //
create procedure mc_upd_compañia(
IN `pv_compania_rtn`                varchar(16), 
IN `pv_compañia_cai`                varchar(255), 
IN `pv_compañia_legal_nom`          varchar(255), 
IN `pv_compañia_comercial_nom`      varchar(255),
IN `pv_compañia_paginaweb`          varchar(100),
IN `pv_compañia_correo`             varchar(100),
IN `pv_compañia_facebook`           varchar(100),
IN `pv_compañia_instagram`          varchar(100) 
 )
begin
 UPDATE compañia
SET
 compania_rtn=pv_compania_rtn
  ,compañia_cai=pv_compañia_cai
  ,compañia_legal_nom = pv_compañia_legal_nom
  , compañia_comercial_nom= pv_compañia_comercial_nom
  ,compañia_paginaweb= pv_compañia_paginaweb
  ,compañia_correo=pv_compañia_correo
  ,compañia_facebook=pv_compañia_facebook
  ,compañia_instagram=pv_compañia_instagram
WHERE  compania_rtn=pv_compania_rtn ;
end; //

-- PROCESO UPDATE TABLA COMPAñIA OFICINA
delimiter //
create procedure mc_upd_compañia_oficina(
IN `pi_oficina_id`            int(11),
IN  `pv_compania_rtn`          varchar(16),
IN  `pv_oficina_nombre`        varchar(50),
IN  `pv_oficina_direccion`     varchar(255),
IN  `pv_municipio_id`          varchar(4),
IN  `pv_departamento_id`       varchar(4),
IN  `pv_oficina_telefono_1`    varchar(25),
IN  `pv_oficina_telefono_2`    varchar(25)
 )
begin
 UPDATE compañia_oficina
SET
 oficina_id=pi_oficina_id
  ,compania_rtn = pv_compania_rtn
  , oficina_nombre= pv_oficina_nombre
  ,oficina_direccion= pv_oficina_direccion
  ,municipio_id=pv_municipio_id
  ,departamento_id=pv_departamento_id
  ,oficina_telefono_1=pv_oficina_telefono_1
  ,oficina_telefono_2=pv_oficina_telefono_2
WHERE  oficina_id= pi_oficina_id;
end; //

-- PROCESO INSERT TABLA DIRECCION CLIENTE
delimiter //
create procedure mc_ins_direccion_cliente(
IN `direccion_id`        int(11),
IN `cliente_id`          int(11),
IN `direccion`           varchar(255),
IN `direccion_ciudad`    varchar(50),
IN `municipio_id`        varchar(4),
IN `departamento_id`     varchar(4),
IN `direccion_telefono`  varchar(30)
 )
begin
 INSERT INTO direccion_cliente(
 direccion_id
  , cliente_id
  ,direccion
  ,direccion_ciudad
  ,municipio_id
  ,departamento_id
  ,direccion_telefono
) VALUES (
 direccion_id
  , cliente_id
  ,direccion
  ,direccion_ciudad
  ,municipio_id
  ,departamento_id
  ,direccion_telefono
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA DIRECCION CLIENTE
select @direccion_id:= max(direccion_id) from direccion_cliente;
end; //

-- PROCESO INSERT TABLA CLIENTE
delimiter //
create procedure mc_ins_cliente(
IN `cliente_id`              int(11),
IN `clinte_correo`           varchar(255),
IN `cliente_contraseña`      text,
IN `cliente_fecha`           timestamp,
IN `cliente_dni`             varchar(15),
IN `cliente_nombre`          varchar(100),
IN `cliente_apellido`        varchar(100),
IN `cliente_telefono`        varchar(30),
IN `cliente_ciudad`          varchar(255),
IN `cliente_direccion`       varchar(255),
IN `departamento_id`         varchar(2),
IN `municipio_id`            varchar(4),
IN `compañia_nombre`         varchar(255),
IN `compania_rtn`            varchar(255)
 )
begin
 INSERT INTO cliente(
 cliente_id
  , clinte_correo
  ,cliente_contraseña
  ,cliente_fecha
  ,cliente_dni
  ,cliente_nombre
  ,cliente_apellido
  ,cliente_telefono
  ,cliente_ciudad
  ,cliente_direccion
  ,departamento_id
  ,municipio_id
  ,compañia_nombre
  ,compania_rtn
) VALUES (
 cliente_id
  , clinte_correo
  ,cliente_contraseña
  ,cliente_fecha
  ,cliente_dni
  ,cliente_nombre
  ,cliente_apellido
  ,cliente_telefono
  ,cliente_ciudad
  ,cliente_direccion
  ,departamento_id
  ,municipio_id
  ,compañia_nombre
  ,compania_rtn
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA DIRECCION CLIENTE
select @cliente_id:= max(cliente_id) from cliente;
end; //

-- PROCESO INSERT TABLA COMPAÑIA
delimiter //
create procedure mc_ins_compañia(
IN `compania_rtn`                varchar(16),
IN `compañia_cai`          varchar(255),  
IN `compañia_legal_nom`          varchar(255), 
IN `compañia_comercial_nom`      varchar(255),
IN `compañia_paginaweb`          varchar(100),
IN `compañia_correo`             varchar(100),
IN `compañia_facebook`           varchar(100),
IN `compañia_instagram`          varchar(100)
 )
begin
 INSERT INTO compañia(
 compania_rtn
  ,compañia_cai
  , compañia_legal_nom
  ,compañia_comercial_nom
  ,compañia_paginaweb
  ,compañia_correo
  ,compañia_facebook
  ,compañia_instagram
) VALUES (
 compañia_rtn
  ,compañia_cai
  , compania_legal_nom
  ,compañia_comercial_nom
  ,compañia_paginaweb
  ,compañia_correo
  ,compañia_facebook
  ,compañia_instagram
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA COMPAñIA
select @compania_rtn:= max(compania_rtn) from compañia;
end; //

-- PROCESO INSERT TABLA COMPAñIA OFICINA
delimiter //
create procedure mc_ins_compañia_oficina(
IN `oficina_id`            int(11),
IN  `compania_rtn`          varchar(16),
IN  `oficina_nombre`        varchar(50),
IN  `oficina_direccion`     varchar(255),
IN  `municipio_id`          varchar(4),
IN  `departamento_id`       varchar(2),
IN  `oficina_telefono_1`    varchar(25),
IN  `oficina_telefono_2`    varchar(25)
 )
begin
 INSERT INTO compañia_oficina(
 oficina_id
  , compania_rtn
  ,oficina_nombre
  ,oficina_direccion
  ,municipio_id
  ,departamento_id
  ,oficina_telefono_1
  ,oficina_telefono_2
) VALUES (
 oficina_id
  , compania_rtn
  ,oficina_nombre
  ,oficina_direccion
  ,municipio_id
  ,departamento_id
  ,oficina_telefono_1
  ,oficina_telefono_2
);
-- SELECCIONAR EL MAXIMO INSERTADO EN LA TABLA COMPAñIA
select @oficina_id:= max(oficina_id) from compañia_oficina;
end; //