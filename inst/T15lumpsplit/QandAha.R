QandAha = function(buttonLabel= "save") {
  thisQANumber = nextNumber(sequenceType = "QA")
  outputIdThisQA = paste0('QA', thisQANumber)
  textareaIdThisQA = paste0('id', outputIdThisQA)
  # output[[outputIdThisQA]] = renderUI({
    textAreaInput(inputId = textareaIdThisQA, width='200%',
                  label = paste("(QA:", thisQANumber, ")",
                                "Ask a question and/or describe an 'aha' here.")
    )
  # })
  # uiOutput(outputId = outputIdThisQA)
}
