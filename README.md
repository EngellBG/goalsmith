# goalsmith

Skill de [Claude Code](https://claude.com/claude-code) que convierte un objetivo crudo en un comando `/goal` bien formado: uno que mantiene al agente trabajando durante jornadas largas en vez de pararse a los pocos minutos.

## El problema

El `/goal` nativo de Claude Code se auto-evalúa con el propio modelo en cada parada (reporta `met` o `not-yet-met`). Tres fallas lo hacen parar temprano:

1. **Auto-aprobación** — un criterio vago deja que el modelo se apruebe solo.
2. **Backlog chico** — una sola tarea termina de verdad en minutos. La duración emerge del trabajo descompuesto; no se puede pedir.
3. **Atasco en lo imposible** — un ítem irrealizable secuestra el loop y el agente re-litiga lo mismo.

`goalsmith` mete las contramedidas dentro de cada goal que emite.

## Qué hace

Dado un objetivo crudo:

1. Corre una **entrevista mínima** (objetivo, criterio, scope, non-goals, backstop).
2. Valida el goal por **gates**: criterio verificable por máquina (no un adjetivo), ruta de verificación concreta, backlog descomponible en N unidades, non-goals explícitos, relectura de intención.
3. Emite un **bloque `/goal` listo para pegar** más un checklist inicial de progreso para disco.

No ejecuta el goal — produce el texto. Es el combustible refinado para el motor `/goal` nativo.

## Instalación

```bash
git clone https://github.com/EngellBG/goalsmith.git
cd goalsmith
./install.sh
```

Luego reinicia Claude Code o corre `/reload-skills`. Invócalo con `/goalsmith` o simplemente pidiendo "créame un goal".

### Instalación manual

Copia `skill/` dentro de `~/.claude/skills/goalsmith/`.

## Fundamento

El diseño se apoya en:

- La mecánica del `/goal` nativo (session Stop hook, `met`/`not-yet-met`, restauración desde el transcript tras compactación).
- El **Ralph loop** (Geoffrey Huntley): una unidad de trabajo por iteración, estado en disco, mantener verde.
- Los patrones de **audit-first completion** de agentes de código autónomos: no aceptar señales proxy como completitud.

## Licencia

MIT
