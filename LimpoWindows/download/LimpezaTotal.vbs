Set shell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

MsgBox "Iniciando a Faxina no Sistema!", 64, "Limpador VBS"

' 1. Limpeza de Cache (Temporários)
On Error Resume Next
tempPath = shell.ExpandEnvironmentStrings("%TEMP%")
fso.DeleteFile(tempPath & "\*.*"), True
fso.DeleteFolder(tempPath & "\*"), True
MsgBox "Cache temporário limpo com sucesso!", 64, "Limpeza"

' 2. Desbotificador (Mata o Copilot via Registro)
shell.RegWrite "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot\TurnOffWindowsCopilot", 1, "REG_DWORD"
MsgBox "Copilot desativado para sempre!", 48, "Desbotificador"

' 3. Corretor de Sistema e Vírus (Abre o CMD para processar)
MsgBox "Vou abrir o CMD para reparar arquivos e escanear vírus agora.", 64, "Sistema"
shell.Run "cmd.exe /c sfc /scannow & ""C:\Program Files\Windows Defender\MpCmdRun.exe"" -Scan -ScanType 1 & pause", 1, True

MsgBox "Processo concluído! Seu PC agradece.", 64, "Finalizado"
