extends Control

var numbers: Array = []

# Função que pega o último caracter da string
func getLastCharacter(text: String) -> String:
	return text.substr(text.length() - 1, 1)

# Função que pega a string, tira o último caracter e transforma em um número
func getNumberWithoutLastCharacter(text: String) -> float:
	return float(text.substr(0, text.length() - 1))

# Função que altera a label da contagem de números do array
func changeNumbersCountLabel():
	$ItemList/NumbersCount.text = " x " + str(len(numbers))
	
# Função que altera a label com os números do array conforme foram inseridos
func changeInsertedNumbersLabel():
	$ItemList/InsertedNumbers.text = "Números inseridos: " + str(numbers)

# Função de sort
func bubbleSort(array: Array):
	# Se o array não tem posições, retorna array vazio. Se tem apenas uma, retorna ela
	if !len(array) || len(array) == 1:
		return array
	
	var number # backup do número para alteração
	var isOrdered = false # Flag se o array está ordenado
	
	while(!isOrdered): # Enquanto não estiver ordenado, fica em loop
		isOrdered = true # Ta ordenado até que se prove o contrário
		for i in range(0, len(array) - 1): # Passa por todas as posições do array, menos a última
			if array[i] > array[i + 1]: # Verifica se a posição atual é maior que a posição final
				isOrdered = false # Se for, o array não está ordenado
				number = array[i] # Guarda backup do número
				array[i] = array[i + 1] # O número atual recebe o da próxima posição
				array[i + 1] = number # O da próxima posição recebe o atual
		print(array) # Print com o resultado de cada loop
		
	return array # Retorna o array

# Função que altera a label com o array ordenado
func changeOrdenedArrayLabel():
	$ItemList/OrdenededArray.text = "Array Ordenado: " + str(bubbleSort(numbers))
	

	
func _on_LineEdit_text_changed(new_text: String):
	# Se o caracter recebido for igual a espaço, pega o número e adiciona no array
	if getLastCharacter(new_text) == ' ':
		numbers.append(getNumberWithoutLastCharacter(new_text))
		$LineEdit.text = ""
		
		# Altera as labels
		changeNumbersCountLabel()
		changeInsertedNumbersLabel()
		
		# Se recebe 10 números, ordena, mostra e reseta o array
		if(len(numbers) == 10):
			changeOrdenedArrayLabel()
			numbers = []
		
