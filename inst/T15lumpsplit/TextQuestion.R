TextQuestion = function(question="What do you think?") {
  thisTQNumber = nextNumber(sequenceType = "TQ")
  outputIdThisTQ = paste0('TQ', thisTQNumber)
  textareaIdThisTQ = paste0('id', outputIdThisTQ)
  output[[outputIdThisTQ]] = renderUI({
    div(HTML(paste0(strong("A question for you: "), em(question))),
        textAreaInput(inputId = textareaIdThisTQ,
                      label = paste("(TQ", thisTQNumber, ")",
                                    "Your answer:")
        )
    )
  })
  uiOutput(outputId = outputIdThisTQ)
}
