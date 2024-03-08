from googletrans import Translator
import json

def translate_json(json_file_path, languages):
    with open(json_file_path, 'r', encoding='utf-8') as file:
        data = json.load(file)

    translator = Translator()

    for language in languages:
        # Load existing translations for the language
        output_file_path = f'{language}.json'
        try:
            with open(output_file_path, 'r', encoding='utf-8') as output_file:
                translated_data = json.load(output_file)
                translated_keys = set(translated_data.keys())
        except FileNotFoundError:
            # If the file does not exist, start fresh
            translated_data = {}
            translated_keys = set()

        new_translations = {}
        for key, value in data.items():
            # Translate only if the key is not already translated
            if key not in translated_keys:
                translated_value = translator.translate(value, dest=language).text
                new_translations[key] = translated_value
                translated_keys.add(key)

        # Update the existing translations with new ones
        translated_data.update(new_translations)

        # Write the updated translations to language.json
        with open(output_file_path, 'w', encoding='utf-8') as output_file:
            json.dump(translated_data, output_file, ensure_ascii=False, indent=2)

        print(f'Translations updated for {language}')

    return f'Translations updated for {languages}'

# Example usage:
json_file_path = 'en.json'
languages = ['bn', 'gu', 'hi', 'kn', 'ml', 'mr', 'or', 'pa', 'ta', 'te', 'ur']
result = translate_json(json_file_path, languages)
print(result)
