(defrule paciente-listo
  (paciente (listo-en-quirofano FALSE))
  (enfermera-asistente (listo-en-quirofano TRUE))
  (anestesiologo (listo-en-quirofano TRUE))
  (cirujano-en-jefe (listo-en-quirofano TRUE))
  (cirujano-2 (listo-en-quirofano TRUE))
  =>
  (printout t "Paciente listo en quirófano." crlf)
  (assert (paciente (listo-en-quirofano TRUE)))
)

(defrule comenzar-operacion
  (paciente (listo-en-quirofano TRUE) (sedado FALSE))
  (enfermera-asistente (listo-en-quirofano TRUE))
  (anestesiologo (listo-en-quirofano TRUE))
  (cirujano-en-jefe (listo-en-quirofano TRUE))
  (cirujano-2 (listo-en-quirofano TRUE))
  =>
  (printout t "Comienza la operación." crlf)
)

(defrule cirujano-2-informa
  (paciente (sedado FALSE))
  (cirujano-2 (listo-en-quirofano TRUE))
  =>
  (printout t "Cirujano 2 informa al Cirujano en Jefe que puede comenzar la intervención." crlf)
)

(defrule ordenar-anestesiologo
  (paciente (sedado FALSE))
  (cirujano-en-jefe (listo-en-quirofano TRUE))
  =>
  (printout t "Cirujano en Jefe ordena al Anestesiólogo confirmar el cálculo del anestésico y aplicarlo al Paciente." crlf)
)

(defrule confirmar-anestesico
  (anestesiologo (listo-en-quirofano TRUE))
  =>
  (printout t "Anestesiólogo confirma que el paciente se encuentra sedado." crlf)
  (assert (paciente (sedado TRUE)))
)

(defrule cirujano-2-comienza
  (paciente (sedado TRUE))
  (cirujano-en-jefe (listo-en-quirofano TRUE))
  (cirujano-2 (listo-en-quirofano TRUE))
  =>
  (printout t "Cirujano en Jefe ordena al Cirujano 2 que puede comenzar la intervención." crlf)
)

(defrule solicitar-material
  (cirujano-2 (listo-en-quirofano TRUE))
  (enfermera-asistente (listo-en-quirofano TRUE))
  =>
  (printout t "Cirujano 2 solicita material e instrumentos a la Enfermera asistente." crlf)
)

(defrule proveer-material
  (enfermera-asistente (listo-en-quirofano TRUE))
  =>
  (printout t "Enfermera asistente provee material e instrumentos al Cirujano 2." crlf)
)

(defrule cirujano-2-realiza
  (cirujano-2 (listo-en-quirofano TRUE))
  =>
  (printout t "Cirujano 2 realiza la intervención." crlf)
)

(defrule cirujano-2-informa-finalizacion
  (paciente (sedado TRUE))
  (cirujano-en-jefe (listo-en-quirofano TRUE))
  =>
  (printout t "Cirujano 2 informa al Cirujano en Jefe sobre la finalización de la intervención." crlf)
)

(defrule finalizar-intervencion
  (paciente (sedado TRUE))
  (enfermera-asistente (listo-en-quirofano TRUE))
  =>
  (printout t "Intervención finalizada. Enfermera asistente lleva al paciente a la Sala de recuperación." crlf)
)
