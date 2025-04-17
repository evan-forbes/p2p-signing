BUF_VERSION := v1.31.0

#? proto-gen: Generate protobuf files
proto-gen:
	@echo "Generating Protobuf files"
	@go run github.com/bufbuild/buf/cmd/buf@$(BUF_VERSION) generate
.PHONY: proto-gen

# These targets are provided for convenience and are intended for local
# execution only.
proto-lint:
	@echo "Linting Protobuf files"
	@go run github.com/bufbuild/buf/cmd/buf@$(BUF_VERSION) lint
.PHONY: proto-lint

proto-format:
	@echo "Formatting Protobuf files"
	@find . -name '*.proto' -path "./proto/*" -exec clang-format -i {} \;
.PHONY: proto-format