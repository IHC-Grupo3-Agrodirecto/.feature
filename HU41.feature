Feature: Firma de entrega
    Como transportista
    deseo que el comprador en el mercado firme en mi pantalla
    para finalizar el viaje legalmente

    Scenario 1: Generación de acta de conformidad mediante firma digital
        Given el arribo confirmado al punto de destino establecido
        When el adquirente registra su rúbrica digital en el dispositivo del transportista
        Then el sistema crea de manera automática el documento electrónico de conformidad
        And distribuye una copia digital del comprobante a los involucrados en la transacción

        INPUT:
            Estado de arribo a destino confirmado
            Rúbrica digital ingresada en la pantalla

        OUTPUT:
            Documento electrónico de conformidad generado
            Envío automático del comprobante a ambas partes

    Scenario 2: Restricción de liberación de fondos por falta de validación del receptor
        Given un traslado finalizado que carece de la rúbrica del receptor
        When el transportista solicita la liberación de los fondos del servicio
        Then el sistema bloquea la transacción temporalmente
        And despliega una advertencia en pantalla indicando la obligatoriedad del documento firmado

        INPUT:
            Traslado finalizado sin rúbrica del receptor
            Acción de solicitar liberación de fondos

        OUTPUT:
            Bloqueo temporal de la transacción
            Mensaje de advertencia sobre la obligatoriedad de la firma
