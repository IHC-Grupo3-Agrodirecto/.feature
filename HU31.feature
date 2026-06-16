Feature: Plan Premium chofer
    Como transportista,
    deseo pagar suscripción,
    para que mi unidad aparezca resaltada y recibir pedidos primero.

    Scenario 1: Resaltado visual en el mapa tras la activación de la suscripción avanzada
        Given un perfil de usuario activo bajo la modalidad o cuenta básica
        When realizo la activación y el pago del plan de suscripción avanzado
        Then el sistema actualiza de manera inmediata la representación gráfica de mi unidad en el mapa
        And aplica un elemento visual distintivo de alta prioridad sobre el icono del vehículo

        INPUT:
            Estado inicial de la cuenta (básica)
            Acción de activar y pagar el plan de suscripción avanzado

        OUTPUT:
            Estado de la cuenta actualizado a nivel superior
            Aplicación de un indicador gráfico distintivo de prioridad en el mapa

    Scenario 2: Priorización de unidades suscritas en el ordenamiento de búsquedas
        Given un cliente o productor que inicia una consulta de transporte en la plataforma
        When el sistema detecta múltiples vehículos disponibles con diferentes niveles de suscripción
        Then la aplicación ordena el listado priorizando a los transportistas con planes avanzados
        And los muestra en las primeras posiciones de los resultados frente a las cuentas básicas

        INPUT:
            Consulta de búsqueda iniciada por un productor o cliente
            Presencia de unidades con suscripción avanzada y básica en el radio de búsqueda

        OUTPUT:
            Listado de resultados ordenado con criterios de relevancia y nivel de plan
            Unidades de nivel superior listadas en las primeras posiciones de la interfaz
