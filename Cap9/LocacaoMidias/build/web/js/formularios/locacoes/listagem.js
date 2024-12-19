function cancelarLocacao(event, cp) {
    event.preventDefault(); // Impede o comportamento padrão do link
    const locacaoId = event.target.getAttribute('data-id'); // Obtém o ID da locação
    const row = event.target.closest('tr'); // Obtém a linha correspondente na tabela

    if (confirm('Deseja realmente cancelar esta locação?')) {
        alert('True'); // Exibe a mensagem "True"

        // Atualiza a célula "Cancelada" para "True"
        const canceladaCell = row.querySelector('td:nth-child(5)');
        if (canceladaCell) {
            canceladaCell.textContent = 'True';
        }

        // Substitui o link "Cancelar" por "Cancelada"
        const cancelarCell = row.querySelector('td:nth-child(6)');
        if (cancelarCell) {
            cancelarCell.textContent = 'Cancelada';
        }

        // Aqui você pode adicionar lógica para enviar uma requisição ao servidor
        // Exemplo:
        // fetch(`${cp}/locacoes/cancelar?id=${locacaoId}`, { method: 'POST' })
        //     .then(response => response.json())
        //     .then(data => {
        //         if (data.success) {
        //             alert('Locação cancelada com sucesso!');
        //             location.reload(); // Recarrega a página para atualizar os dados
        //         } else {
        //             alert('Erro ao cancelar a locação.');
        //         }
        //     });
    }
}
