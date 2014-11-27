namespace :tlds do
  desc "Create CcTld classes from Wikipedia's list of ccTLDs."
  task :update do
    dirname                = File.dirname(__FILE__)
    gen                    = File.join(dirname, %w{tld.rb})
    cc_lib                 = File.expand_path(File.join(dirname, %w{.. lib tld cc.rb}))
    generic_lib            = File.expand_path(File.join(dirname, %w{.. lib tld generic.rb}))
    generic_restricted_lib = File.expand_path(File.join(dirname, %w{.. lib tld generic_restricted.rb}))
    test_lib               = File.expand_path(File.join(dirname, %w{.. lib tld test.rb}))
    infrastructure_lib     = File.expand_path(File.join(dirname, %w{.. lib tld infrastructure.rb}))
    sponsored_lib          = File.expand_path(File.join(dirname, %w{.. lib tld sponsored.rb}))

    require gen

    {
      cc_lib                 => TLD::Task::UpdateCountryCodeTLDs,
      generic_lib            => TLD::Task::UpdateGenericTLDs,
      generic_restricted_lib => TLD::Task::UpdateGenericRestrictedTLDs,
      test_lib               => TLD::Task::UpdateTestTLDs,
      infrastructure_lib     => TLD::Task::UpdateInfrastructureTLDs,
      sponsored_lib          => TLD::Task::UpdateSponsoredTLDs
    }.each_pair do |lib, klass|
      File.open(lib, File::CREAT | File::TRUNC | File::WRONLY) do |f|
        f.write klass.get
      end
    end
  end
end # :currency
