part of '../logger_kit.dart';

abstract class PaginationLogLoader {
  Future<List<RenderableRecord>> fetch(int offset, int take);

  Future<List<RenderableRecord>> fetchAll();
}
