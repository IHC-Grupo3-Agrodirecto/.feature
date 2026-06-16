Feature: Chat de grupo de viaje
    Como usuario,
    deseo chatear con el chofer y otros productores del mismo camión,
    para coordinar el acopio vecinal.

    Scenario 1: Acceso y permisos de mensajería en un chat grupal activo
        Given un viaje consolidado conformado por múltiples productores y un transportista asignado
        When abro la ventana del chat correspondiente a dicho viaje
        Then todos los participantes vinculados pueden leer el historial de conversación
        And tienen habilitada la opción de enviar mensajes en tiempo real al grupo

        INPUT:
            Grupo de viaje consolidado activo con sus integrantes vinculados
            Acción de abrir la interfaz del chat grupal

        OUTPUT:
            Historial de mensajes visible para todos los miembros
            Canal de mensajería bidireccional habilitado

    Scenario 2: Identificación del emisor al enviar un mensaje de estado de carga
        Given el canal de comunicación del viaje abierto en la pantalla
        When un productor envía un mensaje indicando la disponibilidad de su mercancía
        Then el sistema muestra el contenido del texto de forma inmediata para todos
        And antepone de manera clara el alias de identificación del productor que lo redactó

        INPUT:
            Interfaz de mensajería abierta
            Texto enviado por el productor sobre el estado de su carga

        OUTPUT:
            Mensaje publicado correctamente en el flujo grupal
            Alias del emisor visible junto al texto enviado
