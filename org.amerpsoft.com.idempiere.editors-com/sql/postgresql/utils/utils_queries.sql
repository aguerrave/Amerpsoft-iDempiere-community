--
-- PostgreSQL database dump
--
-- This SQL File is the source for Pack out Step # 2
--
SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

/* Agrega campo countrycode3 codigo de tres digitos internacional */

ALTER TABLE "adempiere"."c_country"
  ADD COLUMN "countrycode3" CHAR(3);

ALTER TABLE "adempiere"."c_country"
  ADD COLUMN "hascommunity" CHAR(1) DEFAULT 'Y';

ALTER TABLE "adempiere"."c_country"
  ADD COLUMN "hasmunicipality" CHAR(1) DEFAULT 'Y';
  
ALTER TABLE "adempiere"."c_country"
 ADD COLUMN "hasparish" CHAR(1) DEFAULT 'Y';
  
/* Crea temporal de codigos de tres digitos */
 
CREATE TABLE "adempiere"."c_country2" (
  "countrycode" CHAR(2) NOT NULL, 
  "countrycode3" CHAR(3) NOT NULL, 
  "countryid" CHAR(3) NOT NULL, 
  "name" VARCHAR(60) NOT NULL, 
  "detalle1" VARCHAR(20), 
  "detalle2" VARCHAR(20), 
  "modificado" NUMERIC(1,0)
) WITHOUT OIDS;

/* Data for the `public.c_country2` table  (Records 1 - 244) */

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AW', 'ABW', '533', 'Aruba', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AF', 'AFG', '004', 'Afganistán', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AO', 'AGO', '024', 'Angola', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AI', 'AIA', '660', 'Anguila', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AX', 'ALA', '248', 'Åland', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AL', 'ALB', '008', 'Albania', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AD', 'AND', '020', 'Andorra', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AN', 'ANT', '530', 'Antillas Neerlandesas', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AE', 'ARE', '784', 'Emiratos Árabes Unidos', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AR', 'ARG', '032', 'Argentina', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AM', 'ARM', '051', 'Armenia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AS', 'ASM', '016', 'Samoa Americana', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AQ', 'ATA', '010', 'Antártida', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TF', 'ATF', '260', 'Territorios Australes Franceses', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AG', 'ATG', '028', 'Antigua y Barbuda', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AU', 'AUS', '036', 'Australia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AT', 'AUT', '040', 'Austria', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('AZ', 'AZE', '031', 'Azerbaiyán', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BI', 'BDI', '108', 'Burundi', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BE', 'BEL', '056', 'Bélgica', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BJ', 'BEN', '204', 'Benín', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BF', 'BFA', '854', 'Burkina Faso', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BD', 'BGD', '050', 'Bangladesh', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BG', 'BGR', '100', 'Bulgaria', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BH', 'BHR', '048', 'Bahréin', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BS', 'BHS', '044', 'Bahamas', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BA', 'BIH', '070', 'Bosnia y Herzegovina', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BY', 'BLR', '112', 'Bielorrusia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BZ', 'BLZ', '084', 'Belice', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BM', 'BMU', '060', 'Bermudas', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BO', 'BOL', '068', 'Bolivia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BR', 'BRA', '076', 'Brasil', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BB', 'BRB', '052', 'Barbados', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BN', 'BRN', '096', 'Brunéi', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BT', 'BTN', '064', 'Bután', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BV', 'BVT', '074', 'Isla Bouvet', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('BW', 'BWA', '072', 'Botsuana', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CF', 'CAF', '140', 'República Centroafricana', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CA', 'CAN', '124', 'Canadá', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CC', 'CCK', '166', 'Islas Cocos', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CH', 'CHE', '756', 'Suiza', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CL', 'CHL', '152', 'Chile', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CN', 'CHN', '156', 'China', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CI', 'CIV', '384', 'Costa de Marfil', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CM', 'CMR', '120', 'Camerún', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CD', 'COD', '180', 'República Democrática del Congo', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CG', 'COG', '178', 'República del Congo', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CK', 'COK', '184', 'Islas Cook', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CO', 'COL', '170', 'Colombia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('KM', 'COM', '174', 'Comoras', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CV', 'CPV', '132', 'Cabo Verde', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CR', 'CRI', '188', 'Costa Rica', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CU', 'CUB', '192', 'Cuba', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CX', 'CXR', '162', 'Isla de Navidad', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('KY', 'CYM', '136', 'Islas Caimán', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CY', 'CYP', '196', 'Chipre', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('CZ', 'CZE', '203', 'República Checa', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('DE', 'DEU', '276', 'Alemania', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('DJ', 'DJI', '262', 'Yibuti', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('DM', 'DMA', '212', 'Dominica', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('DK', 'DNK', '208', 'Dinamarca', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('DO', 'DOM', '214', 'República Dominicana', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('DZ', 'DZA', '012', 'Argelia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('EC', 'ECU', '218', 'Ecuador', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('EG', 'EGY', '818', 'Egipto', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('ER', 'ERI', '232', 'Eritrea', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('EH', 'ESH', '732', 'Sahara Occidental', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('ES', 'ESP', '724', 'España (Además están reservados EA para Ceuta y M', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('EE', 'EST', '233', 'Estonia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('ET', 'ETH', '231', 'Etiopía', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('FI', 'FIN', '246', 'Finlandia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('FJ', 'FJI', '242', 'Fiyi', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('FK', 'FLK', '238', 'Islas Malvinas', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('FR', 'FRA', '250', 'Francia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('FO', 'FRO', '234', 'Islas Feroe', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('FM', 'FSM', '583', 'Micronesia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GA', 'GAB', '266', 'Gabón', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GB', 'GBR', '826', 'Reino Unido', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GE', 'GEO', '268', 'Georgia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GG', 'GGY', '831', 'Guernsey', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GH', 'GHA', '288', 'Ghana', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GI', 'GIB', '292', 'Gibraltar', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GN', 'GIN', '324', 'Guinea', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GP', 'GLP', '312', 'Guadalupe', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GM', 'GMB', '270', 'Gambia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GW', 'GNB', '624', 'Guinea-Bissau', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GQ', 'GNQ', '226', 'Guinea Ecuatorial', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GR', 'GRC', '300', 'Grecia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GD', 'GRD', '308', 'Granada', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GL', 'GRL', '304', 'Groenlandia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GT', 'GTM', '320', 'Guatemala', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GF', 'GUF', '254', 'Guayana Francesa', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GU', 'GUM', '316', 'Guam', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GY', 'GUY', '328', 'Guyana', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('HK', 'HKG', '344', 'Hong Kong', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('HM', 'HMD', '334', 'Islas Heard y McDonald', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('HN', 'HND', '340', 'Honduras', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('HR', 'HRV', '191', 'Croacia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('HT', 'HTI', '332', 'Haití', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('HU', 'HUN', '348', 'Hungría', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('ID', 'IDN', '360', 'Indonesia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('IM', 'IMN', '833', 'Isla de Man', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('IN', 'IND', '356', 'India', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('IO', 'IOT', '086', 'Territorio Británico del Océano Índico', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('IE', 'IRL', '372', 'Irlanda', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('IR', 'IRN', '364', 'Irán', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('IQ', 'IRQ', '368', 'Iraq', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('IS', 'ISL', '352', 'Islandia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('IL', 'ISR', '376', 'Israel', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('IT', 'ITA', '380', 'Italia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('JM', 'JAM', '388', 'Jamaica', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('JE', 'JEY', '832', 'Jersey', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('JO', 'JOR', '400', 'Jordania', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('JP', 'JPN', '392', 'Japón', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('KZ', 'KAZ', '398', 'Kazajistán', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('KE', 'KEN', '404', 'Kenia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('KG', 'KGZ', '417', 'Kirguistán', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('KH', 'KHM', '116', 'Camboya', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('KI', 'KIR', '296', 'Kiribati', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('KN', 'KNA', '659', 'San Cristóbal y Nieves', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('KR', 'KOR', '410', 'Corea del Sur', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('KW', 'KWT', '414', 'Kuwait', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('LA', 'LAO', '418', 'Laos', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('LB', 'LBN', '422', 'Líbano', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('LR', 'LBR', '430', 'Liberia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('LY', 'LBY', '434', 'Libia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('LC', 'LCA', '662', 'Santa Lucía', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('LI', 'LIE', '438', 'Liechtenstein', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('LK', 'LKA', '144', 'Sri Lanka', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('LS', 'LSO', '426', 'Lesoto', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('LT', 'LTU', '440', 'Lituania', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('LU', 'LUX', '442', 'Luxemburgo', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('LV', 'LVA', '428', 'Letonia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MO', 'MAC', '446', 'Macao', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MA', 'MAR', '504', 'Marruecos', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MC', 'MCO', '492', 'Mónaco', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MD', 'MDA', '498', 'Moldavia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MG', 'MDG', '450', 'Madagascar', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MV', 'MDV', '462', 'Maldivas', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MX', 'MEX', '484', 'México', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MH', 'MHL', '584', 'Islas Marshall', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MK', 'MKD', '807', 'ARY Macedonia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('ML', 'MLI', '466', 'Malí', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MT', 'MLT', '470', 'Malta', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MM', 'MMR', '104', 'Birmania', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('ME', 'MNE', '499', 'Montenegro', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MN', 'MNG', '496', 'Mongolia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MP', 'MNP', '580', 'Islas Marianas del Norte', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MZ', 'MOZ', '508', 'Mozambique', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MR', 'MRT', '478', 'Mauritania', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MS', 'MSR', '500', 'Montserrat', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MQ', 'MTQ', '474', 'Martinica', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MU', 'MUS', '480', 'Mauricio', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MW', 'MWI', '454', 'Malaui', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('MY', 'MYS', '458', 'Malasia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('YT', 'MYT', '175', 'Mayotte', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('NA', 'NAM', '516', 'Namibia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('NC', 'NCL', '540', 'Nueva Caledonia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('NE', 'NER', '562', 'Níger', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('NF', 'NFK', '574', 'Norfolk', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('NG', 'NGA', '566', 'Nigeria', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('NI', 'NIC', '558', 'Nicaragua', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('NU', 'NIU', '570', 'Niue', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('NL', 'NLD', '528', 'Países Bajos', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('NO', 'NOR', '578', 'Noruega', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('NP', 'NPL', '524', 'Nepal', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('NR', 'NRU', '520', 'Nauru', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('NZ', 'NZL', '554', 'Nueva Zelanda', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('OM', 'OMN', '512', 'Omán', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PK', 'PAK', '586', 'Pakistán', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PA', 'PAN', '591', 'Panamá', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PN', 'PCN', '612', 'Islas Pitcairn', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PE', 'PER', '604', 'Perú', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PH', 'PHL', '608', 'Filipinas', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PW', 'PLW', '585', 'Palaos', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PG', 'PNG', '598', 'Papúa Nueva Guinea', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PL', 'POL', '616', 'Polonia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PR', 'PRI', '630', 'Puerto Rico', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('KP', 'PRK', '408', 'Corea del Norte', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PT', 'PRT', '620', 'Portugal', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PY', 'PRY', '600', 'Paraguay', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PS', 'PSE', '275', 'Territorios palestinos', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PF', 'PYF', '258', 'Polinesia Francesa', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('QA', 'QAT', '634', 'Qatar', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('RE', 'REU', '638', 'Reunión', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('RO', 'ROU', '642', 'Rumania', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('RU', 'RUS', '643', 'Rusia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('RW', 'RWA', '646', 'Ruanda', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SA', 'SAU', '682', 'Arabia Saudita', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SD', 'SDN', '736', 'Sudán', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SN', 'SEN', '686', 'Senegal', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SG', 'SGP', '702', 'Singapur', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('GS', 'SGS', '239', 'Islas Georgias del Sur y Sandwich del Sur', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SH', 'SHN', '654', 'Santa Helena', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SJ', 'SJM', '744', 'Svalbard y Jan Mayen', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SB', 'SLB', '090', 'Islas Salomón', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SL', 'SLE', '694', 'Sierra Leona', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SV', 'SLV', '222', 'El Salvador', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SM', 'SMR', '674', 'San Marino', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SO', 'SOM', '706', 'Somalia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('PM', 'SPM', '666', 'San Pedro y Miquelón', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('RS', 'SRB', '688', 'Serbia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('ST', 'STP', '678', 'Santo Tomé y Príncipe', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SR', 'SUR', '740', 'Surinam', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SK', 'SVK', '703', 'Eslovaquia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SI', 'SVN', '705', 'Eslovenia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SE', 'SWE', '752', 'Suecia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SZ', 'SWZ', '748', 'Suazilandia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SC', 'SYC', '690', 'Seychelles', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('SY', 'SYR', '760', 'Siria', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TC', 'TCA', '796', 'Islas Turcas y Caicos', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TD', 'TCD', '148', 'Chad', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TG', 'TGO', '768', 'Togo', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TH', 'THA', '764', 'Tailandia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TJ', 'TJK', '762', 'Tayikistán', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TK', 'TKL', '772', 'Tokelau', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TM', 'TKM', '795', 'Turkmenistán', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TL', 'TLS', '626', 'Timor Oriental', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TO', 'TON', '776', 'Tonga', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TT', 'TTO', '780', 'Trinidad y Tobago', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TN', 'TUN', '788', 'Túnez', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TR', 'TUR', '792', 'Turquía', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TV', 'TUV', '798', 'Tuvalu', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TW', 'TWN', '158', 'República de China', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('TZ', 'TZA', '834', 'Tanzania', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('UG', 'UGA', '800', 'Uganda', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('UA', 'UKR', '804', 'Ucrania', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('UM', 'UMI', '581', 'Islas ultramarinas de Estados Unidos', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('UY', 'URY', '858', 'Uruguay', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('US', 'USA', '840', 'Estados Unidos', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('UZ', 'UZB', '860', 'Uzbekistán', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('VA', 'VAT', '336', 'Ciudad del Vaticano', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('VC', 'VCT', '670', 'San Vicente y las Granadinas', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('VE', 'VEN', '862', 'República Bolivariana de Venezuela', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('VG', 'VGB', '092', 'Islas Vírgenes Británicas', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('VI', 'VIR', '850', 'Islas Vírgenes Estadounidenses', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('VN', 'VNM', '704', 'Vietnam', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('VU', 'VUT', '548', 'Vanuatu', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('WF', 'WLF', '876', 'Wallis y Futuna', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('WS', 'WSM', '882', 'Samoa', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('YE', 'YEM', '887', 'Yemen', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('ZA', 'ZAF', '710', 'Sudáfrica', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('ZM', 'ZMB', '894', 'Zambia', '', '', 0);

INSERT INTO "adempiere"."c_country2" ("countrycode", "countrycode3", "countryid", "name", "detalle1", "detalle2", "modificado")
VALUES ('ZW', 'ZWE', '716', 'Zimbabue', '', '', 0);

/* Reemplaza el codigo de tres digitos en la tabla c_country*/
update  adempiere.c_country
set countrycode3=(
select adempiere.c_country2.countrycode3 
from  adempiere.c_country2  
where adempiere.c_country.countrycode=adempiere.c_country2.countrycode );
/* Venezuela (339) hasRegion='Y' */
--update	adempiere.c_country set hasregion = 'Y' where c_country_id= 339;

-- Reemplaza valores por defecto todos los campos nuevos
update	adempiere.c_country set hasregion = 'Y' ;
update	adempiere.c_country set hascommunity = 'Y' ;
update	adempiere.c_country set hasmunicipality = 'Y' ;
update	adempiere.c_country set hasparish = 'Y' ;

/* Elimina la tabla c_country2 */
DROP TABLE "adempiere"."c_country2" ;

/* CREA TABLA c_community (REGIONES DE PAISES, COMUNIDADES) */

-- Table: adempiere.c_community

-- DROP TABLE adempiere.c_community;

CREATE TABLE adempiere.c_community
(
    c_community_id numeric(10,0) NOT NULL,
    ad_client_id numeric(10,0) NOT NULL,
    ad_org_id numeric(10,0) NOT NULL,
    isactive character(1) COLLATE pg_catalog."default" NOT NULL,
    created timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
    updatedby numeric(10,0) NOT NULL,
    name character varying(60) COLLATE pg_catalog."default" NOT NULL,
    description character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    c_country_id numeric(10,0) NOT NULL,
    isdefault character(1) COLLATE pg_catalog."default" DEFAULT NULL::bpchar,
    c_community_uu character varying(36) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT c_community_key PRIMARY KEY (c_community_id),
    CONSTRAINT c_community_uu_idx UNIQUE (c_community_uu)
,
    CONSTRAINT c_community_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
    CONSTRAINT c_community_isdefault_check CHECK (isdefault = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE adempiere.c_community
    OWNER to adempiere;

/* Agrega campo c_community_id  a la tabla c_region*/

ALTER TABLE "adempiere"."c_region"
  ADD COLUMN "c_community_id" NUMERIC(10,0);

ALTER TABLE "adempiere"."c_region"
  ALTER COLUMN "c_community_id" SET DEFAULT NULL;
  
/* Agrega restriccion co tabla c_community */
  ALTER TABLE "adempiere"."c_region"
  ADD CONSTRAINT "ccommunity_cregion_fk" FOREIGN KEY ("c_community_id")
    REFERENCES "adempiere"."c_community"("c_community_id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;


CREATE UNIQUE INDEX "c_community_name" ON "adempiere"."c_community"
  USING btree ("c_country_id", "name");
CREATE INDEX "c_region_idx" ON "adempiere"."c_region"
  USING btree ("c_community_id", "c_country_id");  

/*   */    
    
--INICIO DE INCLUSION DE REGIONES (COMMUNITIES) DE VENEZUELA;
insert into "adempiere"."c_community" (c_community_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, c_country_id, isdefault) 
VALUES (33901,0,0,'Y','2010-10-01',0,'2010-10-01',0,'Región Capital','Región Capital',339,'N');
insert into "adempiere"."c_community" (c_community_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, c_country_id, isdefault) 
VALUES (33902,0,0,'Y','2010-10-01',0,'2010-10-01',0,'Región Central','Región Central',339,'N');
insert into "adempiere"."c_community" (c_community_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, c_country_id, isdefault) 
VALUES (33903,0,0,'Y','2010-10-01',0,'2010-10-01',0,'Región Guayanal','Región Guayana',339,'N');
insert into "adempiere"."c_community" (c_community_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, c_country_id, isdefault) 
VALUES (33904,0,0,'Y','2010-10-01',0,'2010-10-01',0,'Región Insular','Región Insular',339,'N');
insert into "adempiere"."c_community" (c_community_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, c_country_id, isdefault) 
VALUES (33905,0,0,'Y','2010-10-01',0,'2010-10-01',0,'Región Los Andes','Región Los Andes',339,'N');
insert into "adempiere"."c_community" (c_community_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, c_country_id, isdefault) 
VALUES (33906,0,0,'Y','2010-10-01',0,'2010-10-01',0,'Región de los Llanos','Región de los Llanos',339,'N');
insert into "adempiere"."c_community" (c_community_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, c_country_id, isdefault) 
VALUES (33907,0,0,'Y','2010-10-01',0,'2010-10-01',0,'Región Nor-Oriental','Región Nor-Oriental',339,'N');
insert into "adempiere"."c_community" (c_community_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, c_country_id, isdefault) 
VALUES (33908,0,0,'Y','2010-10-01',0,'2010-10-01',0,'Región Centro-Ocidental','Región Centro-Ocidental',339,'N');
insert into "adempiere"."c_community" (c_community_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, c_country_id, isdefault) 
VALUES (33909,0,0,'Y','2010-10-01',0,'2010-10-01',0,'Región Zuliana','Región Zuliana',339,'N');


/* Data for the `adempiere.c_community` table  (Records 1 - 255) */
/* UNA COMMUNIDAD POR CADA PAIS DEL RESTO DEL MUNDO PARA MANTENER CONSISTENCIA */

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100335, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community United States Minor Outlying Islands', 'United States Minor Outlying Islands', 335, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100206, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Hungary', 'Hungary', 206, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100207, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Iceland', 'Iceland', 207, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100252, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Montserrat', 'Montserrat', 252, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100254, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Mozambique', 'Mozambique', 254, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100255, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Myanmar', 'Myanmar', 255, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100257, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Nauru', 'Nauru', 257, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100258, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Nepal', 'Nepal', 258, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100283, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Qatar', 'Qatar', 283, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100284, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Reunion', 'Reunion', 284, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100286, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2010-12-18 12:46:11', 0, 'Community Russian Federation', 'Russian Federation', 286, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100288, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Saint Helena', 'Saint Helena', 288, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100289, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Saint Kitts And Nevis', 'Saint Kitts And Nevis', 289, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100291, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Saint Pierre And Miquelon', 'Saint Pierre And Miquelon', 291, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100292, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Saint Vincent And The Grenadines', 'Saint Vincent And The Grenadines', 292, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100294, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community San Marino', 'San Marino', 294, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100296, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Saudi Arabia', 'Saudi Arabia', 296, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100297, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Senegal', 'Senegal', 297, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100299, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Sierra Leone', 'Sierra Leone', 299, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100300, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Singapore', 'Singapore', 300, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100302, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2008-02-25 13:28:06', 0, 'Community Slovenia', 'Slovenia', 302, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100303, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Solomon Islands', 'Solomon Islands', 303, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100305, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community South Africa', 'South Africa', 305, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100100, 0, 0, 'Y', '1999-12-20 09:55:35', 0, '2000-01-02 00:00:00', 0, 'Community United States', 'United States of America', 100, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100103, 0, 0, 'Y', '2000-11-28 17:23:54', 0, '2000-01-02 00:00:00', 0, 'Community Belgium', NULL, 103, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100105, 0, 0, 'Y', '2000-11-28 17:25:11', 0, '2005-06-27 16:14:58', 0, 'Community Nederland', NULL, 105, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100106, 0, 0, 'Y', '2000-11-28 17:25:42', 0, '2006-04-13 13:29:48', 0, 'Community Spain', NULL, 106, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100107, 0, 0, 'Y', '2000-11-28 17:26:22', 0, '2000-01-02 00:00:00', 0, 'Community Switzerland', NULL, 107, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100108, 0, 0, 'Y', '2000-11-28 17:27:26', 0, '2000-01-02 00:00:00', 0, 'Community Austria', 'Österreich', 108, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100306, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community South Georgia And The South Sandwich Islands', 'South Georgia And The South Sandwich Islands', 306, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100308, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Sri Lanka', 'Sri Lanka', 308, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100309, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Sudan', 'Sudan', 309, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100310, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Suriname', 'Suriname', 310, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100311, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Svalbard And Jan Mayen', 'Svalbard And Jan Mayen', 311, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100312, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Swaziland', 'Swaziland', 312, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100313, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Sweden', 'Sweden', 313, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100315, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Syrian Arab Republic', 'Syrian Arab Republic', 315, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100316, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Taiwan', 'Taiwan', 316, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100317, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Tajikistan', 'Tajikistan', 317, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100318, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Tanzania United Republic Of', 'Tanzania United Republic Of', 318, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100282, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Puerto Rico', 'Puerto Rico', 282, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100157, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Comoros', 'Comoros', 157, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100159, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Congo The Democratic Republic Of The', 'Congo The Democratic Republic Of The', 159, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100164, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Cuba', 'Cuba', 164, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100166, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Czech Republic', 'Czech Republic', 166, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100169, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Dominica', 'Dominica', 169, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100171, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Ecuador', 'Ecuador', 171, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100174, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Equatorial Guinea', 'Equatorial Guinea', 174, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100177, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Ethiopia', 'Ethiopia', 177, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100180, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Fiji', 'Fiji', 180, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100183, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community French Guiana', 'French Guiana', 183, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100186, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Gabon', 'Gabon', 186, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100188, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Georgia', 'Georgia', 188, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100192, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Greece', 'Greece', 192, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100194, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Grenada', 'Grenada', 194, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100197, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Guatemala', 'Guatemala', 197, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100200, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Guyana', 'Guyana', 200, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100202, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Heard Island And Mcdonald Islands', 'Heard Island And Mcdonald Islands', 202, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100327, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Turkmenistan', 'Turkmenistan', 327, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100329, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Tuvalu', 'Tuvalu', 329, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100332, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community United Arab Emirates', 'United Arab Emirates', 332, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100337, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Uzbekistan', 'Uzbekistan', 337, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100338, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Vanuatu', 'Vanuatu', 338, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100340, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2005-07-25 10:22:34', 0, 'Community Viet Nam', 'Viet Nam', 340, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100341, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Virgin Islands British', 'Virgin Islands British', 341, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100342, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Virgin Islands U.s.', 'Virgin Islands U.s.', 342, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100343, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Wallis And Futuna', 'Wallis And Futuna', 343, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100344, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Western Sahara', 'Western Sahara', 344, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100346, 0, 0, 'N', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Yugoslavia', 'Yugoslavia', 346, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100348, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Zimbabwe', 'Zimbabwe', 348, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100110, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Afghanistan', 'Afghanistan', 110, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100112, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Algeria', 'Algeria', 112, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100113, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community American Samoa', 'American Samoa', 113, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100115, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Angola', 'Angola', 115, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100117, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Antarctica', 'Antarctica', 117, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100118, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Antigua And Barbuda', 'Antigua And Barbuda', 118, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100120, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Armenia', 'Armenia', 120, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100121, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Aruba', 'Aruba', 121, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100124, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Azerbaijan', 'Azerbaijan', 124, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100125, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Bahamas', 'Bahamas', 125, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100127, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Bangladesh', 'Bangladesh', 127, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100128, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Barbados', 'Barbados', 128, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100131, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Belize', 'Belize', 131, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100133, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Bermuda', 'Bermuda', 133, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100134, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Bhutan', 'Bhutan', 134, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100136, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Bosnia And Herzegovina', 'Bosnia And Herzegovina', 136, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100138, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Bouvet Island', 'Bouvet Island', 138, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100139, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Brazil', 'Brazil', 139, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100141, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Brunei Darussalam', 'Brunei Darussalam', 141, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100142, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Bulgaria', 'Bulgaria', 142, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100349, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Serbia', 'Serbia', 349, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100143, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Burkina Faso', 'Burkina Faso', 143, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100144, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Burundi', 'Burundi', 144, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100146, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Cameroon', 'Cameroon', 146, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100149, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Cayman Islands', 'Cayman Islands', 149, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100150, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Central African Republic', 'Central African Republic', 150, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100152, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Chile', 'Chile', 152, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100154, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Christmas Island', 'Christmas Island', 154, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100261, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community New Caledonia', 'New Caledonia', 261, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100262, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community New Zealand', 'New Zealand', 262, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100263, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Nicaragua', 'Nicaragua', 263, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100264, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Niger', 'Niger', 264, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100265, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Nigeria', 'Nigeria', 265, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100266, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Niue', 'Niue', 266, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100267, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Norfolk Island', 'Norfolk Island', 267, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100268, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Northern Mariana Islands', 'Northern Mariana Islands', 268, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100270, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Oman', 'Oman', 270, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100272, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Palau', 'Palau', 272, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100208, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community India', 'India', 208, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100210, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Iran Islamic Republic Of', 'Iran Islamic Republic Of', 210, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100212, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Ireland', 'Ireland', 212, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100213, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Israel', 'Israel', 213, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100215, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Jamaica', 'Jamaica', 215, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100217, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Jordan', 'Jordan', 217, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100218, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Kazakhstan', 'Kazakhstan', 218, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100219, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Kenya', 'Kenya', 219, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100221, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Korea Democratic People''s Republic Of', 'Korea Democratic People''s Republic Of', 221, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100223, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Kuwait', 'Kuwait', 223, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100224, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Kyrgyzstan', 'Kyrgyzstan', 224, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100226, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Latvia', 'Latvia', 226, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100227, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Lebanon', 'Lebanon', 227, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100228, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Lesotho', 'Lesotho', 228, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100230, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Libyan Arab Jamahiriya', 'Libyan Arab Jamahiriya', 230, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100231, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Liechtenstein', 'Liechtenstein', 231, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100275, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Papua New Guinea', 'Papua New Guinea', 275, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100276, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Paraguay', 'Paraguay', 276, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100277, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Peru', 'Peru', 277, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100278, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Philippines', 'Philippines', 278, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100279, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Pitcairn', 'Pitcairn', 279, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100280, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Poland', 'Poland', 280, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100281, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Portugal', 'Portugal', 281, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100155, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Cocos (keeling) Islands', 'Cocos (keeling) Islands', 155, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100156, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2009-09-17 21:57:21', 0, 'Community Colombia', 'Colombia', 156, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100158, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Congo', 'Congo', 158, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100160, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Cook Islands', 'Cook Islands', 160, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100161, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Costa Rica', 'Costa Rica', 161, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100162, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Cote D''ivoire', 'Cote D''ivoire', 162, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100163, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Croatia', 'Croatia', 163, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100165, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2008-02-25 13:28:26', 0, 'Community Cyprus', 'Cyprus', 165, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100167, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Denmark', 'Denmark', 167, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100168, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Djibouti', 'Djibouti', 168, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100170, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Dominican Republic', 'Dominican Republic', 170, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100172, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Egypt', 'Egypt', 172, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100173, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community El Salvador', 'El Salvador', 173, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100175, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Eritrea', 'Eritrea', 175, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100176, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Estonia', 'Estonia', 176, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100178, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Falkland Islands (malvinas)', 'Falkland Islands (malvinas)', 178, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100179, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Faroe Islands', 'Faroe Islands', 179, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100181, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Finland', 'Finland', 181, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100184, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community French Polynesia', 'French Polynesia', 184, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100185, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community French Southern Territories', 'French Southern Territories', 185, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100187, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Gambia', 'Gambia', 187, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100190, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Ghana', 'Ghana', 190, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100191, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Gibraltar', 'Gibraltar', 191, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100193, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Greenland', 'Greenland', 193, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100195, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Guadeloupe', 'Guadeloupe', 195, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100196, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Guam', 'Guam', 196, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100198, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Guinea', 'Guinea', 198, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100199, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Guinea-bissau', 'Guinea-bissau', 199, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100201, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Haiti', 'Haiti', 201, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100233, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Luxembourg', 'Luxembourg', 233, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100234, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Macao', 'Macao', 234, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100236, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Madagascar', 'Madagascar', 236, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100237, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Malawi', 'Malawi', 237, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100240, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Mali', 'Mali', 240, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100241, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2008-02-25 13:28:46', 0, 'Community Malta', 'Malta', 241, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100243, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Martinique', 'Martinique', 243, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100244, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Mauritania', 'Mauritania', 244, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100246, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Mayotte', 'Mayotte', 246, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100248, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Micronesia Federated States Of', 'Micronesia Federated States Of', 248, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100249, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Moldova Republic Of', 'Moldova Republic Of', 249, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100273, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Palestinian Territory Occupied', 'Palestinian Territory Occupied', 273, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100274, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Panama', 'Panama', 274, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100336, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Uruguay', 'Uruguay', 336, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100251, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Mongolia', 'Mongolia', 251, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100253, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Morocco', 'Morocco', 253, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100256, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Namibia', 'Namibia', 256, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100260, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Netherlands Antilles', 'Netherlands Antilles', 260, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100285, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Romania', 'Romania', 285, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100287, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Rwanda', 'Rwanda', 287, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100290, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Saint Lucia', 'Saint Lucia', 290, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100293, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Samoa', 'Samoa', 293, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100295, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Sao Tome And Principe', 'Sao Tome And Principe', 295, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100298, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Seychelles', 'Seychelles', 298, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100301, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Slovakia', 'Slovakia', 301, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100304, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Somalia', 'Somalia', 304, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100109, 0, 0, 'Y', '2003-01-08 13:06:10', 0, '2000-01-02 00:00:00', 0, 'Community Canada', NULL, 109, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100102, 0, 0, 'Y', '2000-11-28 17:23:06', 0, '2000-01-02 00:00:00', 0, 'Community France', 'France', 102, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100319, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Thailand', 'Thailand', 319, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100345, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Yemen', 'Yemen', 345, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100347, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Zambia', 'Zambia', 347, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100111, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Albania', 'Albania', 111, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100116, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Anguilla', 'Anguilla', 116, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100119, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2005-05-20 17:16:37', 0, 'Community Argentina', 'Argentina', 119, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100122, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Australia', 'Australia', 122, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100126, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Bahrain', 'Bahrain', 126, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100129, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Belarus', 'Belarus', 129, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100132, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Benin', 'Benin', 132, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100135, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Bolivia', 'Bolivia', 135, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100137, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Botswana', 'Botswana', 137, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100140, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community British Indian Ocean Territory', 'British Indian Ocean Territory', 140, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100350, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Montenegro', 'Montenegro', 350, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100145, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Cambodia', 'Cambodia', 145, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100148, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Cape Verde', 'Cape Verde', 148, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100151, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Chad', 'Chad', 151, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100153, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community China', 'China', 153, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100269, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Norway', 'Norway', 269, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100271, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Pakistan', 'Pakistan', 271, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100209, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2010-03-18 19:08:42', 0, 'Community Indonesia', 'Indonesia', 209, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100211, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Iraq', 'Iraq', 211, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100214, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Italy', 'Italy', 214, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100216, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2006-02-23 16:16:56', 0, 'Community Japan', 'Japan', 216, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100220, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Kiribati', 'Kiribati', 220, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100203, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Holy See (vatican City State)', 'Holy See (vatican City State)', 203, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100204, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Honduras', 'Honduras', 204, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100205, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Hong Kong', 'Hong Kong', 205, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100320, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Timor-leste', 'Timor-leste', 320, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100321, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Togo', 'Togo', 321, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100322, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Tokelau', 'Tokelau', 322, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100323, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Tonga', 'Tonga', 323, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100324, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Trinidad And Tobago', 'Trinidad And Tobago', 324, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100325, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Tunisia', 'Tunisia', 325, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100326, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Turkey', 'Turkey', 326, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100328, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Turks And Caicos Islands', 'Turks And Caicos Islands', 328, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100330, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Uganda', 'Uganda', 330, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100331, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Ukraine', 'Ukraine', 331, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100333, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community United Kingdom', 'United Kingdom', 333, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100222, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Korea Republic Of', 'Korea Republic Of', 222, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100225, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Lao People''s Democratic Republic', 'Lao People''s Democratic Republic', 225, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100229, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Liberia', 'Liberia', 229, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100232, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Lithuania', 'Lithuania', 232, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100235, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Macedonia Former Yugoslav Republic Of', 'Macedonia Former Yugoslav Republic Of', 235, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100239, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Maldives', 'Maldives', 239, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100242, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Marshall Islands', 'Marshall Islands', 242, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100245, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Mauritius', 'Mauritius', 245, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100247, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2005-05-07 20:51:55', 0, 'Community Mexico', 'Mexico', 247, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100250, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2000-01-02 00:00:00', 0, 'Community Monaco', 'Monaco', 250, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (150000, 0, 0, 'Y', '2010-03-18 19:14:35', 100, '2010-03-18 19:15:45', 0, 'Community Åland Islands', 'Åland Islands', 50000, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (150001, 0, 0, 'Y', '2010-03-18 19:16:02', 100, '2010-03-18 19:16:02', 0, 'Community Saint Barthélemy', 'Saint Barthélemy', 50001, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (150002, 0, 0, 'Y', '2010-03-18 19:16:25', 100, '2010-03-18 19:16:25', 0, 'Community Guernsey', NULL, 50002, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (150003, 0, 0, 'Y', '2010-03-18 19:16:46', 100, '2010-03-18 19:16:46', 0, 'Community Isle of Man', 'Isle of Man', 50003, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (150004, 0, 0, 'Y', '2010-03-18 19:17:04', 100, '2010-03-18 19:17:04', 0, 'Community Jersey', 'Jersey', 50004, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (150005, 0, 0, 'Y', '2010-03-18 19:17:19', 100, '2010-03-18 19:17:19', 0, 'Community Saint Martin', 'Saint Martin', 50005, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100238, 0, 0, 'Y', '2003-03-09 00:00:00', 0, '2010-03-18 19:17:36', 0, 'Community Malaysia', 'Malaysia', 238, 'Y');

INSERT INTO "adempiere"."c_community" ("c_community_id", "ad_client_id", "ad_org_id", "isactive", "created", "createdby", "updated", "updatedby", "name", "description", "c_country_id", "isdefault")
VALUES (100101, 0, 0, 'Y', '1999-12-20 09:56:40', 0, '2010-04-19 17:30:18', 0, 'Community Germany - Deutschland', NULL, 101, 'Y');

/* Reemplaza el codigo de la region por defecto de todos los paise
   Menos Venezuela 339 */

update  adempiere.c_region
set c_community_id=(
select adempiere.c_community.c_community_id 
from  adempiere.c_community 
where c_region.c_country_id=c_community.c_country_id and c_community.c_country_id <> 339);


--- TABLA DE MUNICIPIOS (c_municipality)
-- Table: adempiere.c_municipality

-- DROP TABLE adempiere.c_municipality;

CREATE TABLE adempiere.c_municipality
(
    c_municipality_id numeric(10,0) NOT NULL,
    ad_client_id numeric(10,0) NOT NULL,
    ad_org_id numeric(10,0) NOT NULL,
    isactive character(1) COLLATE pg_catalog."default" NOT NULL,
    created timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
    updatedby numeric(10,0) NOT NULL,
    name character varying(60) COLLATE pg_catalog."default" NOT NULL,
    capital character varying(60) COLLATE pg_catalog."default" NOT NULL,
    c_country_id numeric(10,0) NOT NULL,
    c_region_id numeric(10,0) NOT NULL,
    isdefault character(1) COLLATE pg_catalog."default" DEFAULT NULL::bpchar,
    c_municipality_uu character varying(36) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT c_municipality_key PRIMARY KEY (c_municipality_id),
    CONSTRAINT c_municipality_uu_idx UNIQUE (c_municipality_uu)
,
    CONSTRAINT adclient_cmunicipality FOREIGN KEY (ad_client_id)
        REFERENCES adempiere.ad_client (ad_client_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT adorg_cmunicipality FOREIGN KEY (ad_org_id)
        REFERENCES adempiere.ad_org (ad_org_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT ccountry_cmunicipality FOREIGN KEY (c_country_id)
        REFERENCES adempiere.c_country (c_country_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT createdby_cmunicipality FOREIGN KEY (createdby)
        REFERENCES adempiere.ad_user (ad_user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT cregion_cmunicipality FOREIGN KEY (c_region_id)
        REFERENCES adempiere.c_region (c_region_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT updatedby_cmunicipality FOREIGN KEY (updatedby)
        REFERENCES adempiere.ad_user (ad_user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT c_municipality_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
    CONSTRAINT c_municipality_isdefault_check CHECK (isdefault = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE adempiere.c_municipality
    OWNER to adempiere;


-- TABLA DE PARROQUIAS (c_parish)
-- Table: adempiere.c_parish

-- DROP TABLE adempiere.c_parish;

CREATE TABLE adempiere.c_parish
(
    c_parish_id numeric(10,0) NOT NULL,
    ad_client_id numeric(10,0) NOT NULL,
    ad_org_id numeric(10,0) NOT NULL,
    isactive character(1) COLLATE pg_catalog."default" NOT NULL,
    created timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
    createdby numeric(10,0) NOT NULL,
    updated timestamp without time zone NOT NULL DEFAULT statement_timestamp(),
    updatedby numeric(10,0) NOT NULL,
    name character varying(60) COLLATE pg_catalog."default" NOT NULL,
    c_country_id numeric(10,0) NOT NULL,
    c_region_id numeric(10,0) NOT NULL,
    c_municipality_id numeric(10,0) NOT NULL,
    isdefault character(1) COLLATE pg_catalog."default" DEFAULT NULL::bpchar,
    c_parish_uu character varying(36) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT c_parish_key PRIMARY KEY (c_parish_id),
    CONSTRAINT c_parish_uu_idx UNIQUE (c_parish_uu)
,
    CONSTRAINT adclient_cparish FOREIGN KEY (ad_client_id)
        REFERENCES adempiere.ad_client (ad_client_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT adorg_cparish FOREIGN KEY (ad_org_id)
        REFERENCES adempiere.ad_org (ad_org_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT ccountry_cparish FOREIGN KEY (c_country_id)
        REFERENCES adempiere.c_country (c_country_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT createdby_cparish FOREIGN KEY (createdby)
        REFERENCES adempiere.ad_user (ad_user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT cregion_cparish FOREIGN KEY (c_region_id)
        REFERENCES adempiere.c_region (c_region_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT updatedby_cparish FOREIGN KEY (updatedby)
        REFERENCES adempiere.ad_user (ad_user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT c_parish_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
    CONSTRAINT c_parish_isdefault_check CHECK (isdefault = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE adempiere.c_parish
    OWNER to adempiere;



