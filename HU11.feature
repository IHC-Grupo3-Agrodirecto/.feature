Feature: Programación de fecha futura de recojo
  Como productor agrícola
  Quiero indicar la fecha de recojo futura
  Para asegurar el flete consolidado después de terminar mi cosecha

  Scenario Outline: Filtrado de ofertas de transporte por fecha
    Given que el productor está publicando su carga
    When selecciona una fecha del calendario:
      | Fecha               | Día             |
      | <fecha>             | <dia>           |
    And presiona "Buscar transportistas"
    Then solo ve ofertas de transportistas disponibles para esa fecha
    And aparecen <numero_ofertas> opciones viables
    And cada oferta muestra: "Disponible para recojo el <fecha>"

    Examples:
      | fecha           | dia      | numero_ofertas |
      | 20 de mayo      | Martes   | 12             |
      | 25 de mayo      | Domingo  | 8              |
      | 1 de junio      | Sábado   | 15             |

  Scenario: Validación de fecha anterior a la actual
    Given que el productor está seleccionando la fecha de recojo
    When intenta seleccionar una fecha anterior al día actual
    And presiona "Aceptar"
    Then el sistema muestra: "No puedes seleccionar una fecha pasada"
    And resalta las fechas disponibles en color verde
    And cierra el intento