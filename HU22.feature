Feature: Filtro de incompatibilidad de carga
  Como sistema,
  Quiero impedir la mezcla de productos químicos con alimentos,
  Para proteger la inocuidad de la carga.

  Scenario Outline: Bloqueo de consolidación entre químicos y alimentos
    Given que una carga de <producto-quimico> ya se encuentra asignada a un camión
    When se intenta subir <producto-alimenticio> al mismo vehículo
    Then el algoritmo debe bloquear la consolidación y mostrar el mensaje de <tipo-error>
    Examples: Combinaciones incompatibles de carga
      | producto-quimico  | producto-alimenticio | tipo-error                                        |
      | "Abono químico"   | "Fruta fresca"       | "No se puede mezclar químicos con alimentos"      |
      | "Pesticida"       | "Verdura fresca"     | "No se puede mezclar químicos con alimentos"      |

  Scenario Outline: Permiso de consolidación entre productos del mismo tipo
    Given que una carga de <producto-base> ya se encuentra en el camión
    When se intenta subir <producto-adicional> al mismo vehículo
    Then el algoritmo debe permitir la consolidación porque ambos pertenecen a la categoría <categoria-compatible>
    Examples: Combinaciones compatibles de carga
      | producto-base | producto-adicional | categoria-compatible |
      | "Papa"        | "Zanahoria"        | "Alimentos"          |
      | "Manzana"     | "Pera"             | "Alimentos"          |