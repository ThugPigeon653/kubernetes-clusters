# Generic commands to locally install minikube. Slightly modified to prevent unneccessary re-downloads(see: https://minikube.sigs.k8s.io/docs/start/)
$minikubeExePath = 'C:\minikube\minikube.exe'
$oldPath = [Environment]::GetEnvironmentVariable('Path', [EnvironmentVariableTarget]::Machine)
if ($oldPath.Split(';') -inotcontains 'C:\minikube'){
  [Environment]::SetEnvironmentVariable('Path', $('{0};C:\minikube' -f $oldPath), [EnvironmentVariableTarget]::Machine)
}
if (-not (Test-Path -Path 'C:\minikube' -PathType Container)) {
    New-Item -Path 'C:\' -Name 'minikube' -ItemType Directory -Force
}
if (-not (Test-Path -Path $minikubeExePath -PathType Leaf)) {
    Invoke-WebRequest -OutFile $minikubeExePath -Uri 'https://github.com/kubernetes/minikube/releases/latest/download/minikube-windows-amd64.exe' -UseBasicParsing
}