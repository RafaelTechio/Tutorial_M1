extends Control
var teste = false
var valor = 0
var numero = 0
var lista = []
var nome
onready var inventario = [
	[get_node("Inventario/Fruit1"),get_node("Inventario/Label1")],
	[get_node("Inventario/Fruit2"),get_node("Inventario/Label2")],
	[get_node("Inventario/Fruit3"),get_node("Inventario/Label3")]
]

func _on_Button_pressed():
	#Coletando dados inseridos pelo usuário
	numero = int($LineEdit.text)
	$Label.text = str(numero)
	lista = []


func _on_Button2_pressed():
	#Incrementando o número inserido pelo usuário
	for i in range(10):
		numero+=i
		lista.append(numero)
	$Label.text = str(lista)

func _on_Button3_pressed():
	var cont = 0
	#Mudando o nome do usuário de acordo com os dados da lista
	#Se houver algum número ímpar o nome deve adicionar "baldo" ao final
	for i in range(len(lista)):
		if(lista[i]%2==1):
			cont+=1
			
	if(cont!=0):
		$Label2.text = str(nome) + "baldo"
	else:
		$Label2.text = "Lista não tem ímpar"		


func _on_LineEdit2_text_changed(new_text):
	nome = new_text
