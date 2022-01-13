<div align="center">

![⌨_App_PCT_PosTransplante_⌨](https://user-images.githubusercontent.com/63831714/149373590-35e5fea2-cde8-401f-a95f-ff4986658a62.png)


 -----------------------------------

![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/FFerrazzaT/App_PCT_PosTransplante-?include_prereleases)
![GitHub](https://img.shields.io/github/license/FFerrazzaT/App_PCT_PosTransplante-)
![GitHub language count](https://img.shields.io/github/languages/count/FFerrazzaT/App_PCT_PosTransplante-)

![GitHub last commit](https://img.shields.io/github/last-commit/FFerrazzaT/App_PCT_PosTransplante-)
![GitHub (Pre-)Release Date](https://img.shields.io/github/release-date-pre/FFerrazzaT/App_PCT_PosTransplante-) 
  
  
  
  
  
  
<div align="left">
  
# ➡️ Configuração VsCode ⬅️

## 📥 Tenha em seu vscode 
* Docker
* Remote Development

## 🪛 Comandos vscode (ctrl+shift+p)
* remote-containers.openFolder
* Abra a pasta atual

A instalação leva em torno de 20 minutos para estar concluida, após a primeira vez será necessario apenas abrir o container
 
  
  
  
  
  
# Docker deamon não responde (linux) 

Execute os seguintes comandos:
  
```bash
    $ systemctl start docker
    $ sudo gpasswd -a $USER docker
```
  
  
  
  
  
# 💻 Configuração Linux 💻

  
 ## 🪛 Configurando arquivos VsCode:
modifique o arquivo na pasta .devcontainer com o seguinte json:
   
```json
    {
        "name": "flutter_docker",
        "context": "..",
        "dockerFile": "../Dockerfile",
        "remoteUser": "developer",  
        "mounts": ["source=/dev/bus/usb,target=/dev/bus/usb,type=bind"],
        "settings": {
          "terminal.integrated.shell.linux": null
        },
        "runArgs": ["--privileged"],
        "extensions": ["dart-code.flutter"],
        "workspaceMount": "source=${localWorkspaceFolder}/workspace,target=/home/developer/workspace,type=bind,consistency=delegated",
        "workspaceFolder": "/home/developer/workspace"
      }
```

# Conexão usb:
Conecte seu dispositivo via usb usando a seguinte configuração:

<div align="center">
  
![device_connection_6165362398652854730](https://user-images.githubusercontent.com/63831714/149371139-8c32e97d-6391-4669-b8a7-d36f8c63f1fe.png)

<div align="left">
  
  
Após isso execute o Flutter Doctor para verificar a configuração, seu retorno será:
![docker_6_1789422217035400562](https://user-images.githubusercontent.com/63831714/149371207-1cd7279e-696f-4cd3-ae28-550980bc4cbc.png)
  
## Nenhuma conexão encontrada
Entre no terminal de sua maquina e execute o seguinte comando:
  
```bash
    $ adb kill-server
```
Apos isso ao executar o Flutter Docter irá aparecer a conexão
  
  
  
  
  
  
  
  
# 💻 Configuração Windows 💻
 
## 🪛 Configurando arquivos VsCode:
modifique o arquivo na pasta .devcontainer com o seguinte json:
  
```json
    {
        "name": "flutter_docker",
        "context": "..",
        "dockerFile": "../Dockerfile",
        "remoteUser": "developer",    
        "settings": {
          "terminal.integrated.shell.linux": null
        },
        "runArgs": ["--privileged"],
        "extensions": ["dart-code.flutter"],
        "workspaceMount": "source=${localWorkspaceFolder}/workspace,target=/home/developer/workspace,type=bind,consistency=delegated",
        "workspaceFolder": "/home/developer/workspace"
      }
```

# Conexão usb:

## 🪛 Configuração no powershell windows:
  
Ao conectar o dispositivo usb no computador, execute o seguinte comando:
  
```powershell
  >> ./adb devices
```

Deverá aparecer um dispositivo

![adb_1_5438489436483966327](https://user-images.githubusercontent.com/63831714/149354745-5cda0e29-b820-437e-b176-84c243b6de98.png)
  
Para configurar uma porta para o docker, rode os seguintes comandos:
  
```powershell
  >> ./adb tcpip 5555
  >> ./adb connect 192.168.0.5:5555
  >> ./adb devices
```
  
## OBS: 
  192.168.0.5 é uma rota padrão do windows, ela pode mudar.... para verificar entre em 'WiFi Settings -> Advanced' e verifique onde está conectado seu aparelho
  
## OBS 2: 
  ao rodar o './adb devices' outra vez deverá aparecer 2 dispositivos conectados, o seu e a porta

 ![adb_2_4221243745857037953](https://user-images.githubusercontent.com/63831714/149355121-236b7ab2-8b62-47f9-bbf5-4b7580ab672d.png)

Desconecte o dispositivo usb e rode o comando './adb devices' para verificar se o dispositivo está conectado via WiFi

## 🪛 Configuração no docker container:

Rode o docker container como aparece no topico  ➡️ Configuração VsCode ⬅️, após aberto rode o seguinte comando no terminal do conteiner:
  
```bash
 $ adb devices
```
  
Irá retornar o seguinte resultado:
![network_1_15452898701014707755](https://user-images.githubusercontent.com/63831714/149370098-f370ed58-f68e-4306-bdf5-1d449a56dda7.png)

Para conectar a porta docker a porta aberta no windows execute o seguinte comando:
  
```bash
 $ adb connect 192.168.0.5:5555
```
 OBS: coloque a mesma rota que o windows

 Seu retorno será o seguinte:
 ![network_2_15806965532104803339](https://user-images.githubusercontent.com/63831714/149370349-9ef8f78e-116f-4131-86a1-53e288db1747.png)

## Config caso aparece no adb devices device unauthorized
```bash
  adb kill-server
  adb connect 192.168.0.5:5555
  adb devices
```  
Verifique se o dispositivo agora aparece apenas device
![network_3_10707792443815120113](https://user-images.githubusercontent.com/63831714/149370553-8b72a8ad-a2b6-47ef-b532-e333a64450c0.png)


# Verificando se está tudo ok
Rode o comando flutter doctor, deverá aparecer assim no terminal:
 
![docker_9_2864675768588190145_hud1531c85735140c3dd60708df7b90612_0_1280x1800_fit_linear_3](https://user-images.githubusercontent.com/63831714/149355801-90e1ed17-1bb6-45fd-a7a4-a635ee084a0f.png)
  

  
