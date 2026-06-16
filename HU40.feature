Feature: Validación QR
    Como productor
    deseo escanear el código del transportista
    para validar que le entregué la mercadería formalmente

    Scenario 1: Actualización exitosa del estado de la carga tras escaneo válido
        Given que la mercadería ha sido colocada en el vehículo de transporte
        When escaneo el código QR proporcionado por el transportista asignado
        Then el sistema actualiza de manera automática el estado del cargamento a una fase activa de traslado

        INPUT:
            Mercadería cargada en el vehículo
            Código QR válido del transportista

        OUTPUT:
            Cambio de estado del cargamento registrado en el sistema

    Scenario 2: Intento de validación con un código QR correspondiente a un servicio concluido
        Given un transportista que presenta un código QR vinculado a un servicio de traslado finalizado
        When el productor intenta realizar el escaneo de dicho elemento visual
        Then el sistema rechaza la operación debido a la expiración de la credencial
        And despliega una advertencia en la interfaz indicando la invalidez del código utilizado

        INPUT:
            Código QR de un viaje cerrado o finalizado
            Acción de escaneo por parte del productor

        OUTPUT:
            Rechazo de la transacción en la plataforma
            Mensaje de advertencia sobre código inválido en pantalla
