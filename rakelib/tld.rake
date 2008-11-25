namespace :update do
  desc "Create CcTld classes from Wikipedia's list of ccTLDs."
  task :tlds do
    dirname            = File.dirname(__FILE__)
    gen                = File.join(dirname, %w{tld.rb})
    cc_lib             = File.expand_path(File.join(dirname, %w{.. lib tld cc_tld.rb}))
    generic_lib        = File.expand_path(File.join(dirname, %w{.. lib tld generic_tld.rb}))
    infrastructure_lib = File.expand_path(File.join(dirname, %w{.. lib tld infrastructure_tld.rb}))
    pseudo_lib         = File.expand_path(File.join(dirname, %w{.. lib tld pseudo_tld.rb}))
    reserved_lib       = File.expand_path(File.join(dirname, %w{.. lib tld reserved_tld.rb}))
    retired_lib        = File.expand_path(File.join(dirname, %w{.. lib tld retired_tld.rb}))
    sponsored_lib      = File.expand_path(File.join(dirname, %w{.. lib tld sponsored_tld.rb}))

    require gen

    {
      cc_lib             => TLD::Task::UpdateCcTlds,
      generic_lib        => TLD::Task::UpdateGenericTlds,
      infrastructure_lib => TLD::Task::UpdateInfrastructureTlds,
      pseudo_lib         => TLD::Task::UpdatePseudoTlds,
      reserved_lib       => TLD::Task::UpdateReservedTlds,
      retired_lib        => TLD::Task::UpdateRetiredTlds,
      sponsored_lib      => TLD::Task::UpdateSponsoredTlds
    }.each_pair do |lib, klass|
      File.open(lib, File::CREAT | File::TRUNC | File::WRONLY) do |f|
        f.write klass.get
      end
    end
  end
end # :currency
