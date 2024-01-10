# Universal helm chart


## Options
### extraVarsFile
With `--set-file` option, common environment values from a file can be provided to the chart. The file support key/value pair in yaml format.
ex) `helm upgrade -i universal-helm-repo/universal-chart [release name here] -f [value file here] --set-file extraVarsFile=[file path/name here]`
