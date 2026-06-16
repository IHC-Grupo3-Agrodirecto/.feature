Feature: Modificación de volumen de carga publicada
  Como productor agrícola
  Deseo ajustar los kilogramos de mi carga publicada
  Para corregir el dato si la cosecha fue menor a lo esperado

  Scenario: Edición exitosa del volumen de carga
    Given que el productor tiene una carga publicada
    When accede a "Mis Publicaciones"
    And selecciona la carga
    And presiona "Editar carga"
    Then aparece formulario con datos precargados
    And puede modificar el peso en kg
    And presiona "Guardar cambios"
    Then se actualiza el volumen en el sistema
    And aparece notificación: "Carga actualizada correctamente"
    And se notifica a transportistas interesados: "El volumen ha cambiado a <nuevo_peso> kg"

  Scenario Outline: Cambios permitidos de volumen
    Given que el productor está editando su carga
    When modifica el volumen:
      | Volumen anterior | Nuevo volumen | Estado        |
      | <anterior>       | <nuevo>       | <estado>      |
    And presiona "Guardar"
    Then el cambio se procesa:
      | Resultado                                |
      | <resultado>                              |
    And aparece recálculo de ahorro estimado

    Examples:
      | anterior | nuevo | estado         | resultado                                    |
      | 500 kg   | 350 kg| Permitido      | Se actualiza y recalcula consolidación      |
      | 500 kg   | 600 kg| Permitido      | Se verifica disponibilidad de transportista  |
      | 500 kg   | 8000kg| No permitido   | Supera capacidad, se solicita otra carga    |