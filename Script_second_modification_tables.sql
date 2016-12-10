--Подготовка таблицы для DML-запросов
CREATE TABLE SELLS (
    ID           INTEGER NOT NULL,
    ID_CAR       INTEGER,
    ID_CLIENT    INTEGER,
    ID_EMPLOYEE  INTEGER,
    PRICE        DECIMAL(18,2),
    SELL_DATE   DATE
);

ALTER TABLE SELLS ADD CONSTRAINT PK_SELL PRIMARY KEY (ID);

ALTER TABLE SELLS ADD CONSTRAINT FK_SELL_1 FOREIGN KEY (ID_CLIENT) REFERENCES CLIENT (ID);
ALTER TABLE SELLS ADD CONSTRAINT FK_SELL_2 FOREIGN KEY (ID_EMPLOYEE) REFERENCES EMPLOYEE (ID);
ALTER TABLE SELLS ADD CONSTRAINT FK_SELL_3 FOREIGN KEY (ID_CAR) REFERENCES CAR (ID);


ALTER TABLE additional_options  ALTER COLUMN ID_ORDER TO ID_SELL;
ALTER TABLE additional_options ADD CONSTRAINT FK_ADDITIONAL_OPTIONS_2 FOREIGN KEY (ID_SELL) REFERENCES SELLS (ID);


ALTER TABLE SELLS ADD CONSTRAINT FK_SELL_3 FOREIGN KEY (ID_CAR) REFERENCES CAR (ID);


ALTER TABLE car_equipment ADD PRICE FLOAT;
ALTER TABLE options ADD PRICE FLOAT;