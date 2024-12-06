params.str = "Hello World"

workflow {
  result = convertToCaps(params.str)
  result.view()
}

process convertToCaps {
  input: val (str)
  output: stdout

  script:
  """
  result=\$(echo ${str} | tr '[:lower:]' '[:upper:]')
  echo "\$result"
  """

}