class Hour {
  String id;
  String data;
  int minutos;
  String? descricao;

  Hour({
    required this.id,
    required this.data,
    required this.minutos,
    this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {"id": id, "data": data, "minutos": minutos, "descricao": descricao};
  }
}
