class Pessoa {
  // Atributos
  int pesId;
  String pesNome;
  DateTime pesDataNascimento;
  String _pesSexo;
  String _pesMae;
  String _pesPai;
  String enderecoCompleto;
  String email;
  String telefone;
  String foto;
  String statusCivil; // Novo atributo

  // Construtor
  Pessoa(
    this.pesId,
    this.pesNome,
    this.pesDataNascimento,
    this._pesSexo,
    this._pesMae,
    this._pesPai,
    this.enderecoCompleto,
    this.email,
    this.telefone,
    this.foto,
    this.statusCivil, // Novo parâmetro
  );

  // Método para listar pessoa com formatação
  String listarPessoa() {
    return '''
ID: $pesId
Nome: $pesNome
Data de Nascimento: ${pesDataNascimento.day}/${pesDataNascimento.month}/${pesDataNascimento.year}
Sexo: $_pesSexo
Mãe: $_pesMae
Pai: $_pesPai
Endereço: $enderecoCompleto
Email: $email
Telefone: $telefone
Foto: $foto
Estado Civil: $statusCivil
''';
  }

  // Método para buscar telefone
  String buscarTelefone(String tel) {
    if (telefone == tel) {
      return "Telefone $tel encontrado para $pesNome.";
    } else {
      return "Telefone não encontrado.";
    }
  }

  // Novo método para calcular idade
  int calcularIdade() {
    DateTime hoje = DateTime.now();
    int idade = hoje.year - pesDataNascimento.year;

    // Verifica se ainda não fez aniversário este ano
    if (hoje.month < pesDataNascimento.month ||
        (hoje.month == pesDataNascimento.month && hoje.day < pesDataNascimento.day)) {
      idade--;
    }
    return idade;
  }
}

void main() {
  // Lista para armazenar pessoas
  List<Pessoa> listaPessoas = [];

  // Simulando a entrada de dados de 3 pessoas
  listaPessoas.add(Pessoa(1, "João Silva", DateTime(1985, 4, 15), "Masculino", "Maria Silva", "José Silva", "Rua A, 123", "joao@email.com", "987654321", "foto1.png", "Solteiro"));
  listaPessoas.add(Pessoa(2, "Ana Costa", DateTime(1992, 9, 22), "Feminino", "Marta Costa", "Paulo Costa", "Rua B, 456", "ana@email.com", "123456789", "foto2.png", "Casada"));
  listaPessoas.add(Pessoa(3, "Carlos Sousa", DateTime(1978, 1, 30), "Masculino", "Sofia Sousa", "Roberto Sousa", "Rua C, 789", "carlos@email.com", "555555555", "foto3.png", "Divorciado"));

  // Exemplo de execução das funcionalidades do menu
  listarPessoas(listaPessoas);  // Listar todas as pessoas

  buscarTelefone(listaPessoas, "123456789");  // Buscar telefone

  calcularIdade(listaPessoas, "Ana Costa");  // Calcular idade
}

// Função para listar todas as pessoas
void listarPessoas(List<Pessoa> listaPessoas) {
  if (listaPessoas.isEmpty) {
    print("\nNenhuma pessoa cadastrada.");
  } else {
    print("\n--- Lista de Pessoas ---");
    for (Pessoa pessoa in listaPessoas) {
      print(pessoa.listarPessoa());
    }
  }
}

// Função para buscar telefone
void buscarTelefone(List<Pessoa> listaPessoas, String telefoneBuscado) {
  if (listaPessoas.isEmpty) {
    print("\nNenhuma pessoa cadastrada.");
  } else {
    bool encontrado = false;

    for (Pessoa pessoa in listaPessoas) {
      if (pessoa.telefone == telefoneBuscado) {
        print(pessoa.buscarTelefone(telefoneBuscado));
        encontrado = true;
        break;
      }
    }

    if (!encontrado) {
      print("Telefone não encontrado.");
    }
  }
}

// Função para calcular idade
void calcularIdade(List<Pessoa> listaPessoas, String nomeBuscado) {
  if (listaPessoas.isEmpty) {
    print("\nNenhuma pessoa cadastrada.");
  } else {
    bool encontrado = false;

    for (Pessoa pessoa in listaPessoas) {
      if (pessoa.pesNome.toLowerCase() == nomeBuscado.toLowerCase()) {
        print("Idade de ${pessoa.pesNome}: ${pessoa.calcularIdade()} anos");
        encontrado = true;
        break;
      }
    }

    if (!encontrado) {
      print("Pessoa não encontrada.");
    }
  }
}
