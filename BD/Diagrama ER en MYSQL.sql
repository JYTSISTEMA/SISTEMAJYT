/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
Tablas del Modulo Empleados
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
-- Tabla Roles de usuarios
CREATE TABLE `rol_usuario` (
  `cod_rol`       int(11) PRIMARY KEY auto_increment,
  `tipo_rol`      varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Tabla Tipo de operacion
CREATE TABLE `tipo_operacion` (
  `cod_tipo_operacion`    int(11) PRIMARY KEY auto_increment,
  `nom_operacion`      varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Tabla Usuarios registrados
CREATE TABLE `usuario_registro` (
  `cod_usuario`           int(11) PRIMARY KEY auto_increment,
  `dni_usuario`           varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena`            text COLLATE utf8_spanish_ci NOT NULL,
  `cod_rol`               int(11)  COMMENT '1001 = Admin, 1002 = Vendedor',
  `fecha`                 timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre`                varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `apellido`              varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `num_telefono`          varchar(30) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `correo_electronico`    varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `departamento`          varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `municipio`             varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion`             varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  
  CONSTRAINT FK_rol_cod_rol FOREIGN key (cod_rol) REFERENCES rol_usuario (cod_rol) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Tabla Registro operacion
CREATE TABLE `registro_operacion`(
  `cod_operacion`             int(11) PRIMARY KEY auto_increment,
  `cod_usuario`               int(11),
  `fecha_operacion`           timestamp NOT NULL DEFAULT current_timestamp(),
  `cod_tipo_operacion`        int(11),
  `referencia_operacion`      varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  
   CONSTRAINT FK_reg_op_cod_usuario FOREIGN key (cod_usuario) REFERENCES usuario_registro (cod_usuario) ON DELETE CASCADE,
   
   CONSTRAINT FK_reg_op_tip_op FOREIGN key (cod_tipo_operacion) REFERENCES tipo_operacion (cod_tipo_operacion) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Tabla pago de salario
CREATE TABLE `pago_salario` (
  `cod_pago`                        int(11) PRIMARY KEY auto_increment,
  `cod_usuario`                     int(11) NOT NULL,
  `sueldo_bruto`                    int(11) NOT NULL DEFAULT 1                COMMENT '1001 = Admin, 1002 = Vendedor',
  `IHSS`                            int(11) NOT NULL,
  `RAP`                             int(11) NOT NULL,
  `otras_deducciones`               int(11) NOT NULL,
  `vacaciones`                      int(11) NOT NULL,
  `descripcion_vacaciones`          varchar(50) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `salario`                         decimal(10,2) DEFAULT NULL,
  
  CONSTRAINT FK_pagem_emp_cod_usuario FOREIGN key (cod_usuario) REFERENCES usuario_registro (cod_usuario) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
Tablas del Modulo cliente
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/ 
-- Tabla municipio
CREATE TABLE IF NOT EXISTS `municipio` (
  `departamento_id`       varchar(2)  DEFAULT NULL,
  `municipio_id`          varchar(4)  NOT NULL,
  `municipio_nombre`      varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  
  PRIMARY KEY ( `municipio_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
 
-- Indices de la tabla municipio
ALTER TABLE `municipio`
 add INDEX ( `departamento_id`),
 add   FOREIGN KEY ( `departamento_id`) REFERENCES `departamento`(`departamento_id`);
 
-- Volcado de datos para la tabla municipio
INSERT INTO `municipio` (`departamento_id`, `municipio_id`, `municipio_nombre`) VALUES
('01', '0101', 'La Ceiba'),
('01', '0102', 'El Porvenir'),
('01', '0103', 'Esparta'),
('01', '0104', 'Jutiapa'),
('01', '0105', 'La Masica'),
('01', '0106', 'San Francisco'),
('01', '0107', 'Tela'),
('01', '0108', 'Arizona'),
('02', '0201', 'Trujillo'),
('02', '0202', 'Balfate'),
('02', '0203', 'Iriona'),
('02', '0204', 'Limón'),
('02', '0205', 'Sabá'),
('02', '0206', 'Santa Fe'),
('02', '0207', 'Santa Rosa de Aguán'),
('02', '0208', 'Sonaguera'),
('02', '0209', 'Tocoa'),
('02', '0210', 'Bonito Oriental'),
('03', '0301', 'Comayagua'),
('03', '0302', 'Ajuterique'),
('03', '0303', 'El Rosario'),
('03', '0304', 'Esquías'),
('03', '0305', 'Humuya'),
('03', '0306', 'La Libertad'),
('03', '0307', 'Lamaní'),
('03', '0308', 'La Trinidad'),
('03', '0309', 'Lejamaní'),
('03', '0310', 'Meámbar'),
('03', '0311', 'Minas de Oro'),
('03', '0312', 'Ojos de Agua'),
('03', '0313', 'San Jerónimo'),
('03', '0314', 'San José de Comayagua'),
('03', '0315', 'San José del Potrero'),
('03', '0316', 'San Luis'),
('03', '0317', 'San Sebastián'),
('03', '0318', 'Siguatepeque'),
('03', '0319', 'Villa de San Antonio'),
('03', '0320', 'Las Lajas'),
('03', '0321', 'Taulabé'),
('04', '0401', 'Santa Rosa de Copán'),
('04', '0402', 'Cabañas'),
('04', '0403', 'Concepción'),
('04', '0404', 'Copán Ruinas'),
('04', '0405', 'Corquín'),
('04', '0406', 'Cucuyagua'),
('04', '0407', 'Dolores'),
('04', '0408', 'Dulce Nombre'),
('04', '0409', 'El Paraíso'),
('04', '0410', 'Florida'),
('04', '0411', 'La Jigua'),
('04', '0412', 'La Unión'),
('04', '0413', 'Nueva Arcadia'),
('04', '0414', 'San Agustín'),
('04', '0415', 'San Antonio'),
('04', '0416', 'San Jerónimo'),
('04', '0417', 'San José'),
('04', '0418', 'San Juan de Opoa'),
('04', '0419', 'San Nicolás'),
('04', '0420', 'San Pedro'),
('04', '0421', 'Santa Rita'),
('04', '0422', 'Trinidad de Copán'),
('04', '0423', 'Veracruz'),
('05', '0501', 'San Pedro Sula'),
('05', '0502', 'Choloma'),
('05', '0503', 'Omoa'),
('05', '0504', 'Pimienta'),
('05', '0505', 'Potrerillos'),
('05', '0506', 'Puerto Cortés'),
('05', '0507', 'San Antonio de Cortés'),
('05', '0508', 'San Francisco de Yojoa'),
('05', '0509', 'San Manuel'),
('05', '0510', 'Santa Cruz de Yojoa'),
('05', '0511', 'Villanueva'),
('05', '0512', 'La Lima'),
('06', '0601', 'Choluteca'),
('06', '0602', 'Apacilagua'),
('06', '0603', 'Concepción de María'),
('06', '0604', 'Duyure'),
('06', '0605', 'El Corpus'),
('06', '0606', 'El Triunfo'),
('06', '0607', 'Marcovia'),
('06', '0608', 'Morolica'),
('06', '0609', 'Namasigüe'),
('06', '0610', 'Orocuina'),
('06', '0611', 'Pespire'),
('06', '0612', 'San Antonio de Flores'),
('06', '0613', 'San Isidro'),
('06', '0614', 'San José'),
('06', '0615', 'San Marcos de Colón'),
('06', '0616', 'Santa Ana de Yusguare'),
('07', '0701', 'Yuscarán'),
('07', '0702', 'Alauca'),
('07', '0703', 'Danlí'),
('07', '0704', 'El Paraíso'),
('07', '0705', 'Güinope'),
('07', '0706', 'Jacaleapa'),
('07', '0707', 'Liure'),
('07', '0708', 'Morocelí'),
('07', '0709', 'Oropolí'),
('07', '0710', 'Potrerillos'),
('07', '0711', 'San Antonio de Flores'),
('07', '0712', 'San Lucas'),
('07', '0713', 'San Matías'),
('07', '0714', 'Soledad'),
('07', '0715', 'Teupasenti'),
('07', '0716', 'Texiguat'),
('07', '0717', 'Vado Ancho'),
('07', '0718', 'Yauyupe'),
('07', '0719', 'Trojes'),
('08', '0801', 'Tegucigalpa (D.C.)'),
('08', '0802', 'Alubarén'),
('08', '0803', 'Cedros'),
('08', '0804', 'Curarén'),
('08', '0805', 'El Porvenir'),
('08', '0806', 'Guaimaca'),
('08', '0807', 'La Libertad'),
('08', '0808', 'La Venta'),
('08', '0809', 'Lepaterique'),
('08', '0810', 'Maraita'),
('08', '0811', 'Marale'),
('08', '0812', 'Nueva Armenia'),
('08', '0813', 'Ojojona'),
('08', '0814', 'Orica(Francisco Morazán)'),
('08', '0815', 'Reitoca'),
('08', '0816', 'Sabanagrande'),
('08', '0817', 'San Antonio de Oriente'),
('08', '0818', 'San Buenaventura'),
('08', '0819', 'San Ignacio'),
('08', '0820', 'San Juan de Flores (Cantarranas)'),
('08', '0821', 'San Miguelito'),
('08', '0822', 'Santa Ana'),
('08', '0823', 'Santa Lucía'),
('08', '0824', 'Talanga'),
('08', '0825', 'Tatumbla'),
('08', '0826', 'Valle de Ángeles'),
('08', '0827', 'Villa de San Francisco'),
('08', '0828', 'Vallecillo'),
('09', '0901', 'Puerto Lempira'),
('09', '0902', 'Brus Laguna'),
('09', '0903', 'Ahuas'),
('09', '0904', 'Juan Francisco Bulnes'),
('09', '0905', 'Ramón Villeda Morales'),
('09', '0906', 'Wampusirpe'),
('10', '1001', 'La Esperanza'),
('10', '1002', 'Camasca'),
('10', '1003', 'Colomoncagua'),
('10', '1004', 'Concepción'),
('10', '1005', 'Dolores'),
('10', '1006', 'Intibucá'),
('10', '1007', 'Jesús de Otoro'),
('10', '1008', 'Magdalena'),
('10', '1009', 'Masaguara'),
('10', '1010', 'San Antonio'),
('10', '1011', 'San Isidro'),
('10', '1012', 'San Juan'),
('10', '1013', 'San Marcos de la Sierra'),
('10', '1014', 'San Miguel Guancapla'),
('10', '1015', 'Santa Lucía'),
('10', '1016', 'Yamaranguila'),
('10', '1017', 'San Francisco de Opalaca'),
('11', '1101', 'Roatán'),
('11', '1102', 'Guanaja'),
('11', '1103', 'José Santos Guardiola'),
('11', '1104', 'Utila'),
('12', '1201', 'La Paz'),
('12', '1202', 'Aguanqueterique'),
('12', '1203', 'Cabañas'),
('12', '1204', 'Cane'),
('12', '1205', 'Chinacla'),
('12', '1206', 'Guajiquiro'),
('12', '1207', 'Lauterique'),
('12', '1208', 'Marcala'),
('12', '1209', 'Mercedes de Oriente'),
('12', '1210', 'Opatoro'),
('12', '1211', 'San Antonio del Norte'),
('12', '1212', 'San José'),
('12', '1213', 'San Juan'),
('12', '1214', 'San Pedro de Tutule'),
('12', '1215', 'Santa Ana'),
('12', '1216', 'Santa Elena'),
('12', '1217', 'Santa María'),
('12', '1218', 'Santiago de Puringla'),
('12', '1219', 'Yarula'),
('13', '1301', 'Gracias'),
('13', '1302', 'Belén'),
('13', '1303', 'Candelaria'),
('13', '1304', 'Cololaca'),
('13', '1305', 'Erandique'),
('13', '1306', 'Gualcince'),
('13', '1307', 'Guarita'),
('13', '1308', 'La Campa'),
('13', '1309', 'La Iguala'),
('13', '1310', 'Las Flores'),
('13', '1311', 'La Unión'),
('13', '1312', 'La Virtud'),
('13', '1313', 'Lepaera'),
('13', '1314', 'Mapulaca'),
('13', '1315', 'Piraera'),
('13', '1316', 'San Andrés'),
('13', '1317', 'San Francisco'),
('13', '1318', 'San Juan Guarita'),
('13', '1319', 'San Manuel Colohete'),
('13', '1320', 'San Rafael'),
('13', '1321', 'San Sebastián'),
('13', '1322', 'Santa Cruz'),
('13', '1323', 'Talgua'),
('13', '1324', 'Tambla'),
('13', '1325', 'Tomalá'),
('13', '1326', 'Valladolid'),
('13', '1327', 'Virginia'),
('13', '1328', 'San Marcos de Caiquín'),
('14', '1401', 'Nueva Ocotepeque'),
('14', '1402', 'Belén Gualcho'),
('14', '1403', 'Concepción'),
('14', '1404', 'Dolores Merendón'),
('14', '1405', 'Fraternidad'),
('14', '1406', 'La Encarnación'),
('14', '1407', 'La Labor'),
('14', '1408', 'Lucerna'),
('14', '1409', 'Mercedes'),
('14', '1410', 'San Fernando'),
('14', '1411', 'San Francisco del Valle'),
('14', '1412', 'San Jorge'),
('14', '1413', 'San Marcos'),
('14', '1414', 'Santa Fe'),
('14', '1415', 'Sensenti'),
('14', '1416', 'Sinuapa'),
('15', '1501', 'Juticalpa'),
('15', '1502', 'Campamento'),
('15', '1503', 'Catacamas'),
('15', '1504', 'Concordia'),
('15', '1505', 'Dulce Nombre de Culmí'),
('15', '1506', 'El Rosario'),
('15', '1507', 'Esquipulas del Norte'),
('15', '1508', 'Gualaco'),
('15', '1509', 'Guarizama'),
('15', '1510', 'Guata'),
('15', '1511', 'Guayape'),
('15', '1512', 'Jano'),
('15', '1513', 'La Unión'),
('15', '1514', 'Mangulile'),
('15', '1515', 'Manto'),
('15', '1516', 'Salamá'),
('15', '1517', 'San Esteban'),
('15', '1518', 'San Francisco de Becerra'),
('15', '1519', 'San Francisco de la Paz'),
('15', '1520', 'Santa María del Real'),
('15', '1521', 'Silca'),
('15', '1522', 'Yocón'),
('15', '1523', 'Patuca'),
('16', '1601', 'Santa Bárbara'),
('16', '1602', 'Arada'),
('16', '1603', 'Atima'),
('16', '1604', 'Azacualpa'),
('16', '1605', 'Ceguaca'),
('16', '1606', 'San José de las Colinas'),
('16', '1607', 'Concepción del Norte'),
('16', '1608', 'Concepción del Sur'),
('16', '1609', 'Chinda'),
('16', '1610', 'El Níspero'),
('16', '1611', 'Gualala'),
('16', '1612', 'Ilama'),
('16', '1613', 'Macuelizo'),
('16', '1614', 'Naranjito'),
('16', '1615', 'Nuevo Celilac'),
('16', '1616', 'Petoa'),
('16', '1617', 'Protección'),
('16', '1618', 'Quimistán'),
('16', '1619', 'San Francisco de Ojuera'),
('16', '1620', 'San Luis'),
('16', '1621', 'San Marcos'),
('16', '1622', 'San Nicolás'),
('16', '1623', 'San Pedro Zacapa'),
('16', '1624', 'Santa Rita'),
('16', '1625', 'San Vicente Centenario'),
('16', '1626', 'Trinidad'),
('16', '1627', 'Las Vegas'),
('16', '1628', 'Nueva Frontera'),
('17', '1701', 'Alianza'),
('17', '1702', 'Amapala'),
('17', '1703', 'Aramecina'),
('17', '1704', 'Caridad'),
('17', '1705', 'Goascorán'),
('17', '1706', 'Langue'),
('17', '1707', 'Nacaome'),
('17', '1708', 'San Francisco de Coray'),
('17', '1709', 'San Lorenzo'),
('18', '1801', 'Yoro'),
('18', '1802', 'Arenal'),
('18', '1803', 'El Negrito'),
('18', '1804', 'El Progreso'),
('18', '1805', 'Jocón'),
('18', '1806', 'Morazán'),
('18', '1807', 'Olanchito'),
('18', '1808', 'Santa Rita'),
('18', '1809', 'Sulaco'),
('18', '1810', 'Victoria'),
('18', '1811', 'Yorito');
 
 -- Tabla departamento
CREATE TABLE  IF NOT EXISTS `departamento` (
  `departamento_id`           varchar(2) NOT NULL,
  `departamento_nom`       varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  
  PRIMARY KEY (`departamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcado de datos para la tabla departamento
INSERT INTO `departamento` (`departamento_id`, `departamento_nom`) VALUES
('01', 'Atlántida'),
('02', 'Colón'),
('03', 'Comayagua'),
('04', 'Copán'),
('05', 'Cortés'),
('06', 'Choluteca'),
('07', 'El Paraíso'),
('08', 'Francisco Morazán'),
('09', 'Gracias a Dios'),
('10', 'Intibucá'),
('11', 'Islas de la Bahía'),
('12', 'La Paz'),
('13', 'Lempira'),
('14', 'Ocotepeque'),
('15', 'Olancho'),
('16', 'Santa Bárbara'),
('17', 'Valle'),
('18', 'Yoro');

-- Tabla direccion cliente
CREATE TABLE IF NOT EXISTS  `direccion_cliente` (
  `direccion_id`        int(11) not null auto_increment,
  `cliente_id`          int(11) DEFAULT NULL,
  `direccion`           varchar(255)  DEFAULT NULL,
  `direccion_ciudad`    varchar(50)  DEFAULT NULL,
  `municipio_id`        varchar(4)  DEFAULT NULL,
  `departamento_id`     varchar(4)  DEFAULT NULL,
  `direccion_telefono`  varchar(30) DEFAULT NULL,
  
  PRIMARY KEY (`direccion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Indices de la tabla direccion_cliente
ALTER TABLE `direccion_cliente`
ADD  INDEX (`cliente_id`,`departamento_id`,`municipio_id`),
  ADD  FOREIGN KEY ( `cliente_id`) REFERENCES `cliente`(`cliente_id`),
  ADD  FOREIGN KEY ( `departamento_id`) REFERENCES `departamento`(`departamento_id`),
  ADD  FOREIGN KEY ( `municipio_id`) REFERENCES `municipio`(`municipio_id`);

-- Tabla cliente
  create TABLE IF NOT EXISTS `cliente` (
  `cliente_id`              int(11) auto_increment ,
  `clinte_correo`           varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT  '' ,
  `cliente_contraseña`      text COLLATE utf8_spanish_ci NOT NULL,
  `cliente_fecha`           timestamp NOT NULL DEFAULT current_timestamp(),
  `cliente_dni`             varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `cliente_nombre`          varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `cliente_apellido`        varchar(100) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `cliente_telefono`        varchar(30) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `cliente_ciudad`          varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `cliente_direccion`       varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `departamento_id`         varchar(2) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `municipio_id`            varchar(4) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `compañia_nombre`         varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `compania_rtn`            varchar(16) COLLATE utf8_spanish_ci,
  
PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Tabla compañia
CREATE TABLE IF NOT EXISTS `compañia` (
  `compania_rtn`                varchar(16)  NOT NULL ,
  `compañia_cai`                varchar(255)  DEFAULT NULL,
  `compañia_legal_nom`          varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `compañia_comercial_nom`      varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `compañia_paginaweb`          varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `compañia_correo`             varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `compañia_facebook`           varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `compañia_instagram`          varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  
   PRIMARY KEY (`compania_rtn`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Tabla company office
CREATE TABLE IF NOT EXISTS `compañia_oficina` (
  `oficina_id`            int(11) NOT NULL auto_increment ,
  `compania_rtn`          varchar(16) COLLATE utf8_spanish_ci DEFAULT NULL,
  `oficina_nombre`        varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `oficina_direccion`     varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `municipio_id`          varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `departamento_id`       varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `oficina_telefono_1`    varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `oficina_telefono_2`    varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,

constraint fk_departamento foreign key (departamento_id) references departamento (departamento_id) on delete cascade,

constraint fk_municipio foreign key (municipio_id) references municipio (municipio_id) on delete cascade,
  
PRIMARY KEY (`oficina_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Indices de la tabla compañia oficina
alter table `compañia_oficina`
  add  INDEX (`compania_rtn`),
  add FOREIGN KEY (`compania_rtn`) REFERENCES `compañia`(`compania_rtn`);

/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
TABLAS MODULO PRODUCCION
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
-- Tabla Productos
Create table productos(
  cod_producto        int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL    COMMENT 'llave primaria de la tabla, Codigo de producto'
  ,nombre_producto    varchar(100)  DEFAULT NULL                     COMMENT 'nombre del producto'
  ,descrip_producto   varchar(255)  DEFAULT NULL                     COMMENT 'descripcion del producto'
  ,precio_producto    decimal(10,2) DEFAULT NULL                     COMMENT 'precio del producto '
  )ENGINE=INNODB   
CHARACTER SET UTF8
COLLATE UTF8_UNICODE_CI;

-- Tabla Productos Inventarios
CREATE TABLE productos_inventario(
  cod_lote                        int(11) PRIMARY KEY AUTO_INCREMENT  NOT NULL     COMMENT 'llave primaria de la tabla, codigo de lote'   
  ,cod_producto                   int(11) DEFAULT NULL                             COMMENT 'llave secundaria de la tabla, Codigo de producto'
  ,fech_creacion_lote             datetime DEFAULT NULL                            COMMENT 'Fecha de creacion de lote'
  ,fech_caducidad_lote            datetime DEFAULT NULL                            COMMENT 'Fecha de caducidad del lote'
  ,cant_lote                      decimal(10,2) DEFAULT NULL                       COMMENT 'cantidad de lote'
  ,prec_vent_lote                 decimal(10,2) DEFAULT NULL                       COMMENT 'precio de venta del lote'
  
  ,FOREIGN KEY(cod_producto) REFERENCES productos (cod_producto) ON DELETE CASCADE
)ENGINE=INNODB
CHARACTER SET UTF8
COLLATE UTF8_UNICODE_CI;

/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
Tablas del Modulo ventas
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
-- Tabla Ventas
create table ventas (
cod_venta            bigint (11) primary key auto_increment         comment 'cod de la venta',
cod_usuario          int(11) not null                               comment 'cod del usuario',
cliente_id           int(11) not null                               comment 'cod del cliente',
fecha_creacion       datetime                                       comment 'fecha de creacion',

constraint fk_cliente foreign key (cliente_id) references cliente (cliente_id) on delete cascade,

constraint fk_usuario foreign key (cod_usuario) references usuario_registro (cod_usuario) on delete cascade

)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Tabla detalle venta
create table detalle_venta(
cod_detalle_venta       bigint(11) primary key auto_increment       comment 'cod del detalle de venta',
cod_venta               bigint(11)                                  comment 'cod de la venta',
cod_producto            int(11)                                     comment 'cod del Producto',
cantidad                int(11)                                     comment 'cantidad del producto',
precio_venta            decimal(10,2)                               comment 'precio de venta del producto',
descuento               decimal(10,2)                               comment 'Descuento que se le aplico al cliente',
impuesto_sobre_venta    decimal (10,2)                              comment 'impuesto sobre venta',
subtotal                decimal(10,2)                               comment 'subtotal de la venta',

constraint fk_venta_detalle_venta foreign key (cod_venta) references ventas (cod_venta) on delete cascade,

constraint fk_detalle_venta_productos foreign key (cod_producto) references productos (cod_producto) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*************************************************************************************************
**************************************************************************************************
**************************************************************************************************
TABLAS MODULO INVENTARIO
**************************************************************************************************
**************************************************************************************************
**************************************************************************************************/
-- Tabla Materia Prima
Create TABLE materia_prima(
cod_materia              INT (11) PRIMARY KEY NOT NULL auto_increment                  COMMENT 'CODIGO DE LA MATERIA PRIMA'
,nom_materia              VARCHAR (100) COLLATE utf8_spanish_ci DEFAULT NULL                  COMMENT 'NOMBRE DE LA MATERIA PRIMA'
,descripcion              VARCHAR (255)COLLATE utf8_spanish_ci DEFAULT NULL                   COMMENT 'DESCRIPCI�N DE LA MATERIA'
,pre_Compra_materia       DECIMAL (10,2) DEFAULT NULL                                         COMMENT 'CANTIDAD DE PRODUCTO'
,tip_medida               VARCHAR (10) COLLATE utf8_spanish_ci DEFAULT NULL                   COMMENT 'KILO, LIBRA, UNIDAD METRO'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Tabla inventario materia prima
Create TABLE inventario_materia_prima(
cod_invent_materia_prima          INT (11)  PRIMARY KEY NOT NULL   auto_increment          COMMENT 'CODIGO DEL ROW'
,cod_materia    INT (11)      DEFAULT NULL                                                 COMMENT 'CODIGO DE LA MATERIA'
,fec_compra     DATETIME      DEFAULT NULL                                                 COMMENT 'FECHA DE LA COMPRA DE MATERIA'
,can_Compra     DECIMAL (10,2) DEFAULT NULL                                                COMMENT 'CANTIDAD DE COMPRA'
,pre_compra     DECIMAL (10,2) DEFAULT NULL                                                COMMENT 'PRECIO COMPRA'
,fec_caducidad  DATE        DEFAULT NULL                                                   COMMENT 'FECHA DE CADICIDAD'

,FOREIGN KEY(cod_materia) REFERENCES materia_prima (cod_materia) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Tabla producto materia prima
Create TABLE producto_materia_prima(
cod_prod_mat_prima        INT (11) PRIMARY KEY NOT NULL  auto_increment            COMMENT 'CODIGO DEL ROW'
,cod_producto             INT (11) DEFAULT NULL                                    COMMENT 'CODIGO DEL PRODUCTO'
,cod_materia              INT (11) DEFAULT NULL                                    COMMENT 'CODIGO DE LA MATERIA'
,can_materia_requerida    DECIMAL (10,2) DEFAULT NULL                              COMMENT 'CODIGO DE LA MATERIA REQUERIDA'

,FOREIGN KEY(cod_producto) REFERENCES productos (cod_producto) ON DELETE CASCADE

,FOREIGN KEY(cod_materia) REFERENCES materia_prima (cod_materia) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Tabla users
CREATE TABLE `users` (
  `id`                              bigint(20) UNSIGNED NOT NULL,
  `name`                            varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email`                           varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at`               timestamp NULL DEFAULT NULL,
  `password`                        varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret`               text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes`       text COLLATE utf8mb4_unicode_ci,
  `remember_token`                  varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id`                 bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path`              varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at`                      timestamp NULL DEFAULT NULL,
  `updated_at`                      timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla failed_jobs
CREATE TABLE `failed_jobs` (
  `id`                      bigint(20) UNSIGNED NOT NULL,
  `uuid`                    varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection`              text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue`                   text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload`                 longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception`               longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at`               timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla migrations
CREATE TABLE `migrations` (
  `id`            int(10) UNSIGNED NOT NULL,
  `migration`     varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch`         int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla password_resets
CREATE TABLE `password_resets` (
  `email`         varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token`         varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at`    timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla personal_access_tokens
CREATE TABLE `personal_access_tokens` (
  `id`                    bigint(20) UNSIGNED NOT NULL,
  `tokenable`             varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name`                  varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token`                 varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities`             text COLLATE utf8mb4_unicode_ci,
  `last_used_at`          timestamp NULL DEFAULT NULL,
  `created_at`            timestamp NULL DEFAULT NULL,
  `updated_at`            timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla sessions
CREATE TABLE `sessions` (
  `id`              varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id`         bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address`      varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent`      text COLLATE utf8mb4_unicode_ci,
  `payload`         text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity`   int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



   
