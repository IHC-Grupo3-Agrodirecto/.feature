Feature: Publicación de carga parcial de productor
  Como productor agrícola
  Quiero registrar una carga de 500kg o menos
  Para ser agrupado con vecinos que tengan poco volumen y compartir transporte

  Scenario Outline: Registro exitoso de carga parcial
    Given que el productor accede a "Publicar carga"
    When completa el formulario con los siguientes datos:
      | Campo                   | Valor                |
      | <campo>                 | <valor>              |
    And presiona "Publicar"
    Then la carga aparece en el mapa de consolidación
    And aparece en el sistema de búsqueda para transportistas
    And recibe notificación: "Tu carga ha sido publicada"

    Examples:
      | campo                   | valor                |
      | Peso en kg              | 500                  |
      | Tipo de producto        | Papa                 |
      | Provincia de origen     | Lurín                |
      | Destino                 | Mercado Mayorista    |
      | Fecha de recojo         | 20 de mayo          |

  Scenario: Validación de peso inválido
    Given que el productor está diligenciando el formulario de publicación
    When ingresa un peso negativo o cero
    And presiona "Publicar"
    Then el sistema muestra: "Ingresa un peso válido mayor a 0 kg"
    And resalta el campo en rojo
    And no permite continuar