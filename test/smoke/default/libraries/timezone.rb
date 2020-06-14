class Timezone < Inspec.resource(1)
  name 'timezone'

  desc '
    Testing which timezone is set on the machine.
  '

  example '
    describe timezone do
      it { should be_utc }
    end
  '

  def initialize()
  end

  def method_missing(name)
    @params[name]
  end

  def utc?
    get_tz.stdout.include? "UTC"
  end

  def timezone?(tz)
    get_tz.stdout.include? tz
  end

  private

  def get_tz
    inspec.command('date +"%Z %z"')
  end
end
