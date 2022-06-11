abstract class IMap {
  const IMap();

  Map<String, dynamic> toMap();
}

abstract class Params implements IMap {}

class ParamsWrapper extends Params {
  final Map<String, dynamic> params;

  ParamsWrapper(this.params);

  @override
  Map<String, dynamic> toMap() => params;
}

class NoParams extends Params {
  @override
  Map<String, dynamic> toMap() => {};
}

class PagingParams extends Params {
  final int page;
  final int pageSize;

  PagingParams({
    this.page = 1,
    this.pageSize = 20,
  });

  @override
  Map<String, dynamic> toMap() => {
        'pageNumber': page,
        'pageSize': pageSize,
      };
}
