Feature: Comisión automática
    Como sistema
    quiero descontar la comisión de gestión de cada flete
    para mantener la startup operativa

    Scenario 1: Retención de comisión estándar para un usuario básico
        Given una transacción cerrada con un costo de flete para un usuario básico
        When se liquida el pago correspondiente
        Then el sistema retiene automáticamente el porcentaje estándar como tasa de servicio
        And calcula el monto final de la tasa de servicio de AgroDirecto

        INPUT:
            Monto del flete
            Tipo de usuario (básico)
            Porcentaje de comisión estándar

        OUTPUT:
            Monto de la comisión retenida
            Monto neto a liquidar

    Scenario 2: Descuento de comisión especial para un productor premium
        Given un productor con una membresía premium elegible para una comisión reducida
        When completa un flete y se liquida el pago correspondiente
        Then el sistema descuenta solo el porcentaje especial en lugar de la tasa estándar
        And el comprobante de pago refleja la tarifa especial aplicada

        INPUT:
            Monto del flete
            Tipo de usuario (premium)
            Porcentaje de comisión reducida asociado a la membresía

        OUTPUT:
            Monto de la comisión especial retenida
            Comprobante con el detalle de la tarifa especial aplicada
