<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddVersionUserRelation extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('versions', function (Blueprint $table) {
            $table->char('user_id', 36);
        });

        if (Config::get('paperwork.emergency_export') && ((DB::table('migrations')->select(DB::raw('count(*) as migrations_count, batch'))->where('batch', '=', 1)->get()) > Config::get('paperwork.emergency_export_count'))) {
          // we skip this
        } else {
          Schema::table('versions', function (Blueprint $table) {
              $table->foreign('user_id')->references('id')->on('users');
          });
        }

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('versions', function (Blueprint $table) {
            $table->dropColumn('user_id');
        });
    }

}
