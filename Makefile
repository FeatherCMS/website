CUR_DIR = $(CURDIR)

run:
	swift run Feather

clean:
	rm -rf ./db.sqlite ./Resources/ ./Public/

env:
	echo 'BASE_URL="http://0.0.0.0:8080"' > .env.development
	echo 'BASE_PATH="$(CUR_DIR)/"' >> .env.development

env.testing:
	echo 'BASE_URL="http://0.0.0.0:8080"' > .env.testing
	echo 'BASE_PATH="$(CUR_DIR)/"' >> .env.testing

test: env.testing
	swift test --enable-test-discovery

install:
	swift package update
	swift build -c release
	install .build/Release/Feather ./feather

uninstall:
	rm ./feather
