Feature: Confirmar llegada
    Como transportista,
    deseo presionar un botón al llegar al acopio,
    para que el productor baje su mercadería de inmediato.

    Scenario 1: Despacho de alerta push por confirmación de arribo en zona válida
        Given la proximidad geográfica verificada respecto a las coordenadas del punto de acopio
        When acciono la opción para confirmar mi llegada en la interfaz
        Then el sistema distribuye de manera automatizada una notificación push al dispositivo del agricultor
        And el mensaje solicita el inicio inmediato de la descarga de la mercadería

        INPUT:
            Coordenadas GPS dentro del perímetro del punto de acopio
            Acción de presionar el botón de confirmación de llegada

        OUTPUT:
            Envío automatizado de la alerta push
            Mensaje de aviso de descarga recibido por el agricultor

    Scenario 2: Bloqueo de confirmación por distancia insuficiente al destino
        Given que el vehículo de transporte se encuentra fuera del rango de cercanía permitido
        When intento accionar la opción para confirmar la llegada al punto de destino
        Then el sistema mantiene la función deshabilitada en la pantalla de la aplicación
        And despliega una advertencia indicando la necesidad de aproximarse al punto de acopio

        INPUT:
            Coordenadas GPS fuera del perímetro de validación establecido
            Acción de intentar presionar el botón de confirmación

        OUTPUT:
            Función de confirmación bloqueada o atenuada en la interfaz
            Mensaje restrictivo de aproximación visible para el transportista
