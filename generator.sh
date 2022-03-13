SWIFT_MODULE_SRC="Modules/PetsNetwork/Sources/PetsNetwork"

openapi-generator generate -i "pets.yaml" -g swift5 -o "api-mobile" --additional-properties hashableModels=false

rm -r $SWIFT_MODULE_SRC""*
cp -R "api-mobile/OpenAPIClient/Classes/OpenAPIs/". $SWIFT_MODULE_SRC
rm -r "api-mobile"
