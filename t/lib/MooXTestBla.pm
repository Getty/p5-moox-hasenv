package MooXTestBla;
use MooX::HasEnv;

has_env bla => MOOX_HAS_ENV_TEST_BLA => 'blub';
has_env blaover => MOOX_HAS_ENV_TEST_BLAOVER => 'blubover';
has_env blabla => undef, 'blubblub';
has_env over => MOOX_HAS_ENV_TEST_OVER => 'never be';

1;