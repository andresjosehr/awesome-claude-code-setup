# Asistente de Refactorizacion

Por favor, ayudame a refactorizar codigo sistematicamente usando un enfoque estructurado:

## 1. Definir la Refactorizacion
Primero, identifica claramente:
- **Que**: El codigo/patron especifico a refactorizar
- **Por que**: La razon de la refactorizacion (mantenibilidad, rendimiento, etc.)
- **Alcance**: Que partes del codigo estan afectadas

## 2. Fase de Descubrimiento
Usa herramientas de busqueda para encontrar todas las ocurrencias:
```bash
# Encontrar uso directo
chs find-code "ExactPatternName"

# Encontrar imports/requires
chs search-imports "module-name"

# Encontrar patrones similares
chs search-function "functionName"
chs search-class "ClassName"

# Encontrar archivos de prueba
chs find-file "*.test.*" | xargs grep -l "PatternName"
```

## 3. Analisis de Impacto
- Listar todos los archivos que necesitan cambios
- Identificar posibles cambios incompatibles
- Verificar dependencias externas

## 4. Plan de Migracion
Crear un plan paso a paso:
1. Actualizar implementacion principal
2. Actualizar imports/exports
3. Actualizar todos los usos
4. Actualizar pruebas
5. Actualizar documentacion

## 5. Ejecutar Cambios
Para cada archivo:
- Hacer el cambio
- Verificar con el linter/verificador de tipos de tu proyecto
- Ejecutar pruebas relacionadas
- Hacer commit de cambios con mensajes significativos

## 6. Verificacion
Despues de todos los cambios:
- Ejecutar suite completa de pruebas
- Verificar errores de tipos/lint
- Verificar que no hay imports rotos
- Revisar todos los cambios

## 7. Documentacion
Actualizar cualquier elemento afectado:
- Archivos README
- Documentacion de API
- Comentarios de codigo
- Guias de migracion para cambios incompatibles

Rastrea el progreso y asegurate de que no se pierda nada!
