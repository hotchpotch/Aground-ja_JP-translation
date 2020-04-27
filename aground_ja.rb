#!/usr/bin/env ruby

require 'pathname'
require 'fileutils'

aground_path = ARGV.shift || "#{ENV['HOME']}/Library/Application Support/Steam/steamapps/common/Aground/"

aground_dir = Pathname.new aground_path
aground_lang_dir = aground_dir.join("data/core/lang")
aground_font_dir = aground_lang_dir.join("fonts")

ja_lang = "ja_JP"

source_ja_xml = Pathname.new(__FILE__).parent.join("translation/#{ja_lang}.xml")
languages_xml = aground_lang_dir.join("languages.xml")

en_xml = aground_lang_dir.join "en_US.xml"
ja_xml = aground_lang_dir.join "#{ja_lang}.xml"

font_ja_dir = Pathname.new(__FILE__).parent

def get_transration(source)
  regexps = {
    section: %r{<section\s+id="(.+?)">(.+?)</section>}m,
    text: %r{<text\s+id="(.+?)">(.*?)</text>}m,
  }

  translations = {}
  sections = source.scan(regexps[:section])
  sections.each do |section, data|
    translations[section] = data.scan(regexps[:text])
  end
  translations
end

def replace_transrations(orig, lang, language, translations)
  source = orig.clone
  source.sub!(' id="en_US"', %Q{ id="#{lang}"})
  source.sub!(' name="English" ', %Q{ name="#{language}" font="fonts/#{lang}.fnt" })
  translations.each do |section, texts|
    texts.each do |text_id, text|
      re = Regexp.new(%Q{(<section\s+id="#{section}">.*?<text\s+id="#{text_id}">)(.*?)(</text>.*?</section>)}, Regexp::MULTILINE)
      if source.match(re)
        source.gsub!(re) { "#{$1}#{text}#{$3}" }
      end
    end
  end
  source
end

def update_languages_xml(source, lang)
  us_lang_line = '<include id="en_US.xml" includeRoot="true" />'
  source = source.clone
  new_lang_line = us_lang_line.sub('en_US', lang)
  if source.include? new_lang_line
    nil
  else
    source.gsub(us_lang_line, us_lang_line + "\n    " + new_lang_line)
  end
end

translations = get_transration(source_ja_xml.read)
ja_xml_source = replace_transrations(en_xml.read, ja_lang, 'Japanese', translations)

puts "日本語 xml ファイルに書き込みます\n-> #{ja_xml}"
ja_xml.open('w') {|f| f.puts ja_xml_source }

puts "フォントファイルをコピーします"

Pathname.glob(font_ja_dir.join('fonts/*')).each do |file|
  puts "#{file.realpath} -> #{aground_font_dir}"
  FileUtils.copy(file.to_s, aground_font_dir.to_s)
end

if updated_languages_source = update_languages_xml(languages_xml.read, ja_lang)
  languages_xml_backup = languages_xml.sub_ext('.xml.backup')
  puts "languages.xml ファイルのバックアップを作成します\n-> #{languages_xml_backup}"
  languages_xml_backup.open('w') {|f| f.puts languages_xml.read }

  puts "languages.xml ファイルを更新します\n-> #{languages_xml}"
  languages_xml.open('w') {|f| f.puts updated_languages_source }
end

