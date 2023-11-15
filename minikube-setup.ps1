# Generic commands to locally install tools. Slightly modified to prevent unneccessary re-downloads
# (see: https://minikube.sigs.k8s.io/docs/start/)
Write-Host "Checking minikube installation..."
$minikubeExePath = 'C:\minikube\minikube.exe'
$oldPath = [Environment]::GetEnvironmentVariable('Path', [EnvironmentVariableTarget]::Machine)
if ($oldPath.Split(';') -inotcontains 'C:\minikube'){
  Write-Host "Installing minikube..."
  [Environment]::SetEnvironmentVariable('Path', $('{0};C:\minikube' -f $oldPath), [EnvironmentVariableTarget]::Machine)
}
else{
  Write-Host "Minikube already installed"
}
if (-not (Test-Path -Path 'C:\minikube' -PathType Container)) {
    Write-Host "Minikube path updated"
    New-Item -Path 'C:\' -Name 'minikube' -ItemType Directory -Force
}
if (-not (Test-Path -Path $minikubeExePath -PathType Leaf)) {
    Invoke-WebRequest -OutFile $minikubeExePath -Uri 'https://github.com/kubernetes/minikube/releases/latest/download/minikube-windows-amd64.exe' -UseBasicParsing
}