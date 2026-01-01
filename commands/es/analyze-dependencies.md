# Analizar Dependencias

Por favor, realiza un analisis completo de dependencias de este proyecto:

## 1. Vision General de Dependencias
Primero, recopila informacion de dependencias de tu proyecto:
- Revisa los archivos de paquetes (package.json, requirements.txt, go.mod, pom.xml, etc.)
- Lista todas las dependencias directas y transitivas
- Identifica las herramientas de gestion de dependencias utilizadas

## 2. Auditoria de Seguridad
Ejecuta verificaciones de seguridad en las dependencias:
- Usa las herramientas de auditoria de seguridad de tu lenguaje
- Busca vulnerabilidades conocidas en las dependencias
- Identifica paquetes con avisos de seguridad

## 3. Analisis de Uso
Encuentra que dependencias se estan utilizando realmente:
- Usa `chs search-imports` para encontrar declaraciones de importacion
- Busca dependencias no utilizadas que pueden eliminarse
- Identifica funcionalidad duplicada entre paquetes

## 4. Recomendaciones de Actualizacion
Proporciona un informe organizado con:
- **Actualizaciones Criticas de Seguridad** - Deben actualizarse inmediatamente
- **Actualizaciones de Version Mayor** - Cambios incompatibles a considerar
- **Actualizaciones Menores/Parches** - Seguras para actualizar
- **Dependencias No Utilizadas** - Pueden eliminarse
- **Oportunidades de Optimizacion** - Paquetes alternativos mas ligeros

## 5. Plan de Implementacion
Crea un plan paso a paso para:
1. Eliminar dependencias no utilizadas
2. Actualizar problemas criticos de seguridad
3. Planificar migraciones de versiones mayores
4. Documentar cualquier cambio incompatible

Usa los scripts auxiliares durante todo el proceso para verificar cambios y asegurar que nada se rompa.
